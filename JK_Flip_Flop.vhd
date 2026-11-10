library ieee;
use ieee.std_logic_1164.all;

entity JK_Flip_Flop is
    port(
        clk   : in  std_logic;
        j     : in  std_logic;
        k     : in  std_logic;
        clr   : in  std_logic;
        set   : in  std_logic;
        q     : out std_logic;
        not_q : out std_logic
    );
end entity JK_Flip_Flop;

architecture bhv of JK_Flip_Flop is
    signal q_internal : std_logic := '0';
begin
    process(clk, clr, set)
    begin
        if clr = '1' then
            q_internal <= '0';
        elsif set = '1' then
            q_internal <= '1';
        elsif rising_edge(clk) then
            if    (j = '1' and k = '0') then
                q_internal <= '1';
            elsif (j = '0' and k = '1') then
                q_internal <= '0';
            elsif (j = '1' and k = '1') then
                q_internal <= not q_internal;
            end if;
        end if;
    end process;

    q     <= q_internal;
    not_q <= not q_internal;
end architecture bhv;