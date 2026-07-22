library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity baud_generator is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        baud_tick : out STD_LOGIC
    );
end baud_generator;

architecture Behavioral of baud_generator is

    -- 100 MHz Clock ? 9600 Baud
    constant CLOCK_FREQ : integer := 100000000;
    constant BAUD_RATE  : integer := 9600;
    constant BAUD_COUNT : integer := CLOCK_FREQ / BAUD_RATE;

    signal counter : integer range 0 to BAUD_COUNT-1 := 0;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            counter   <= 0;
            baud_tick <= '0';

        elsif rising_edge(clk) then

            if counter = BAUD_COUNT-1 then
                counter   <= 0;
                baud_tick <= '1';
            else
                counter   <= counter + 1;
                baud_tick <= '0';
            end if;

        end if;
    end process;

end Behavioral;