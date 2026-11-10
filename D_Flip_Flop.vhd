library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity D_Flip_Flop is
    port(
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end entity D_Flip_Flop;

architecture bhv of D_Flip_Flop is
begin
    process(clk)
    begin
        if(clk'event AND clk = '1') then
            q <= d;
        end if;
    end process;
end architecture bhv;