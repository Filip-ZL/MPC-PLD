----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 04:24:30 PM
-- Design Name: 
-- Module Name: btn_in - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity btn_in is
    Generic(
        CONSTANT DEB_PERIOD : POSITIVE := 2
    );
    Port ( btn : in STD_LOGIC;
           ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           btn_debounced : out STD_LOGIC;
           btn_edge_pos : out STD_LOGIC;
           btn_edge_neg : out STD_LOGIC;
           btn_edge_any : out STD_LOGIC);
end btn_in;

architecture Behavioral of btn_in is
    SIGNAL sig_out    :  STD_LOGIC := '0';
    SIGNAL sig_deb  : STD_LOGIC := '0';
    
    
    COMPONENT sync_reg
    PORT (sig_in  : in STD_LOGIC;
          clk     : in STD_LOGIC;
          sig_out : out STD_LOGIC);
    END COMPONENT;
    COMPONENT debouncer
    GENERIC(
        DEB_PERIOD : POSITIVE := 5
    );
    PORT(btn_in    : in STD_LOGIC;
         ce        : in STD_LOGIC;
         clk       : in STD_LOGIC;
         btn_out   : out STD_LOGIC);
    END COMPONENT;
    COMPONENT edge_detector
    PORT(sig_in   : in STD_LOGIC;
         clk      : in STD_LOGIC;
         edge_pos : out STD_LOGIC;
         edge_neg : out STD_LOGIC;
         edge_any : out STD_LOGIC);
    END COMPONENT;
begin

sync_reg_i : sync_reg
PORT MAP(
    clk => clk,
    sig_in => btn,
    sig_out => sig_out
);

debouncer_i : debouncer
GENERIC MAP(
    DEB_PERIOD => DEB_PERIOD
)
PORT MAP(
    clk => clk,
    ce => ce,
    btn_in => sig_out,
    btn_out => sig_deb
);

edge_detector_i : edge_detector
PORT MAP(
    clk => clk,
    sig_in => sig_deb,
    edge_pos => btn_edge_pos,
    edge_neg => btn_edge_neg,
    edge_any => btn_edge_any
);

btn_debounced <= sig_deb;

end Behavioral;