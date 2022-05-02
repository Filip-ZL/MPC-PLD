library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
    port(
        clk         : IN std_logic;
        btn_1       : IN std_logic;
        btn_2       : IN std_logic;
        btn_3       : IN std_logic;
        btn_4       : IN std_logic;
        cnt         : IN std_logic;
        led_o       : OUT std_logic_vector(7 DOWNTO 0);
        pswd_done   : OUT std_logic;
        cnt_rst     : OUT std_logic
    );
end entity;

architecture Behavioral of FSM is
    type state is (Idle, St1, St2, St3, St4, St5, St6, St7, St8);
    SIGNAL pres_state    : state := Idle;
    SIGNAL next_state    : state := Idle;
    SIGNAL cnt_rst_next  : std_logic := '0';
--    SIGNAL pswd_done     : std_logic := '0';
    SIGNAL cnt_sig       : std_logic := '0';
    SIGNAL led_o_next    : std_logic_vector(7 DOWNTO 0);
begin
    
    ff : process (clk)
    begin
        if rising_edge(clk) then
            pres_state <= next_state;
            cnt_sig <= cnt;
            cnt_rst <= cnt_rst_next;
            led_o <= led_o_next;
        end if; 
    end process;
    
    nsl : process (pres_state, btn_1, btn_2, btn_3, btn_4, cnt_sig)
    begin
        next_state <= pres_state;
        cnt_rst_next <= '0';
        pswd_done <= '0';
        case pres_state is 
            when Idle =>
                if btn_1 = '1' then
                    next_state <= St1;
                    cnt_rst_next <= '1';
                elsif btn_2 = '1' or btn_3 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St1 =>
                if btn_4 = '1' then
                    next_state <= St2;
                    cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_2 = '1' or btn_3 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;            
            when St2 =>
                if btn_3 = '1' then
                    next_state <= St3;
                    cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_2 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St3 =>
                if btn_2 = '1' then
                    next_state <= St4;
                    cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_3 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St4 =>
                if btn_3 = '1' then
                   next_state <= St5;
                   cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_2 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St5 =>
                if btn_4 = '1' then
                   next_state <= St6;
                   cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_2 = '1' or btn_3 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St6 =>
                if btn_3 = '1' then
                   next_state <= St7;
                   cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_2 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;
            when St7 =>
                if btn_2 = '1' then
                   next_state <= St8;
                   cnt_rst_next <= '1';
                elsif btn_1 = '1' or btn_3 = '1' or btn_4 = '1' or cnt_sig='1' then
                    next_state <= idle;
                end if;           
            when St8 =>
                if cnt_sig='0' then
                    pswd_done <= '1';
                else
                    next_state <= Idle;   
                end if;
        end case;
    end process;
    
    ol : process (pres_state)
    begin
        led_o_next <= (OTHERS => '0');
        
        case pres_state is 
            when Idle =>
                led_o_next <= "00000000";
            when St1 =>
                led_o_next <= "00010000";
            when St2 =>
                led_o_next <= "00100001";
            when St3 =>
                led_o_next <= "00110001";
            when St4 =>
                led_o_next <= "01000011";
            when St5 =>
                led_o_next <= "01010011";
            when St6 =>
                led_o_next <= "01100111";
            when St7 =>
                led_o_next <= "01110111";
            when St8 =>
                led_o_next <= "10001111";
        end case;
    end process;
    
end architecture Behavioral;
