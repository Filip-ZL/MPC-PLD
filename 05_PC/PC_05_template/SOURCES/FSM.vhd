library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
    port(
        clk         : IN std_logic;
        btn_ss      : IN std_logic;
        btn_lc      : IN std_logic;
        cnt_EN      : OUT std_logic;
        disp_EN     : OUT std_logic;
        cnt_rst     : OUT std_logic
    );
end entity;

architecture Behavioral of FSM is
    type state is (Idle, Run, Lap, Refresh, Stop);
    SIGNAL pres_state    : state := Idle;
    SIGNAL next_state    : state := Idle;
    SIGNAL cnt_rst_next  : std_logic := '0';
    SIGNAL cnt_EN_next   : std_logic := '0';
    SIGNAL disp_EN_next  : std_logic := '0';
begin
    
    ff : process (clk)
    begin
        if rising_edge(clk) then
            pres_state <= next_state;
            cnt_EN <= cnt_EN_next;
            disp_EN <= disp_EN_next;
            cnt_rst <= cnt_rst_next;
        end if; 
    end process;
    
    nsl : process (pres_state, btn_ss, btn_lc)
    begin
        next_state <= Idle;
        case pres_state is 
            when Idle =>
                if btn_ss = '1' then
                    next_state <= Run;
                end if;
            when Run =>
                if btn_ss = '1' then
                    next_state <= Stop;
                elsif (btn_ss = '0') and (btn_lc = '1') then
                    next_state <= Lap;
                elsif (btn_lc = '0') and (btn_ss = '0') then
                    next_state <= Run;
                end if;
            when Lap =>
                if btn_ss = '1' then
                    next_state <= Run;
                elsif (btn_ss = '0') and (btn_lc = '1') then
                    next_state <= Refresh;
                elsif (btn_ss = '0') and (btn_lc = '0') then
                    next_state <= Lap;
                end if;
            when Refresh =>
                next_state <= Lap;
            when Stop =>
                if btn_ss = '1' then
                    next_state <= Run;
                elsif (btn_ss = '0') and (btn_lc = '1') then
                    next_state <= Idle;
                elsif (btn_ss = '0') and (btn_lc = '0') then
                    next_state <= Stop;
                end if;
        end case;
    end process;
    
    ol : process (pres_state)
    begin
        cnt_rst_next <= '0';
        cnt_EN_next <= '0';
        disp_EN_next <= '0';
        
        case pres_state is 
            when Idle =>
                cnt_rst_next <= '1';
                disp_EN_next <= '1';
            when Run =>
                cnt_EN_next <= '1';
                disp_EN_next <= '1';
            when Lap =>
                cnt_EN_next <= '1';
            when Refresh =>
                cnt_EN_next <= '1';
                disp_EN_next <= '1';
            when Stop =>
                disp_EN_next <= '1';
        end case;
    end process;
    
end architecture Behavioral;
