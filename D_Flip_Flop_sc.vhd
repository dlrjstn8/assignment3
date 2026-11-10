library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity D_Flip_Flop_sc is
    port(
        clk : in std_logic;
        d : in std_logic;
        clr : in std_logic;
        set : in std_logic;
        q : out std_logic;
        not_q : out std_logic
    );
end D_Flip_Flop_sc;
architecture bhv of D_Flip_Flop_sc is
    signal q_reg : std_logic := '0';
begin
    process(clk, clr, set)
    begin
        if clr ='1' then
            q_reg <= '0';
        elsif set = '1' then
            q_reg <= '1';
        elsif (clk'event AND clk = '1') then
            q_reg <= d;
        end if;
    end process;
    q <= q_reg;
    not_q <= not q_reg;
end architecture bhv;