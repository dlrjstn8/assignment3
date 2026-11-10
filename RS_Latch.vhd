library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RS_Latch is
    port(
        R :in std_logic;
        S :in std_logic;
        Q :out std_logic;
        not_Q :out std_logic
    );
end entity RS_Latch;

architecture bhv of RS_Latch is
   signal q_reg : std_logic := '0';
begin
    process(R, S)
    begin
        if (S = '1' and R = '0') then
            q_reg <= '1';
        elsif (S = '0' and R = '1') then
            q_reg <= '0';
        elsif (S = '0' and R = '0') then
            null;
        else
            q_reg <= 'X';
        end if;
    end process;

    Q     <= q_reg;
    not_Q <= not q_reg;
end architecture bhv;