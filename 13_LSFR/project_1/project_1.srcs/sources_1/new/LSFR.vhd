----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2022 01:30:06 PM
-- Design Name: 
-- Module Name: LSFR - Behavioral
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

entity LSFR is
    Port ( CLK : in STD_LOGIC;
           EN : in STD_LOGIC;
           RST : in STD_LOGIC;
           SREG : out STD_LOGIC_VECTOR(16 downto 1);
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end LSFR;

architecture Behavioral of LSFR is
    SIGNAL Currstate : std_logic_vector (16 DOWNTO 1) := X"00FF"; 
    SIGNAL Nextstate : std_logic_vector (16 DOWNTO 1);
    SIGNAL feedback  : std_logic;
begin

    lsfr : process(CLK) is
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                Currstate <= X"00FF";
            elsif EN = '1' then
                Currstate <= Nextstate;
            end if;
        end if;
    end process;
    
    feedback <= (Currstate(Currstate'high) XOR Currstate(10));
    Nextstate <= Currstate(Currstate'high - 1 DOWNTO 1) & feedback;
    
    DOUT <= Currstate(5) & Currstate(12) & Currstate(10) & Currstate(11) & Currstate(1) & Currstate(6) & Currstate(8) & Currstate(7);
    SREG <= Currstate;
end Behavioral;
