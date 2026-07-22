library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        baud_tick : in  STD_LOGIC;
        rx        : in  STD_LOGIC;
        data_out  : out STD_LOGIC_VECTOR(7 downto 0);
        rx_done   : out STD_LOGIC
    );
end uart_rx;

architecture Behavioral of uart_rx is

    type state_type is (IDLE, DATA_BITS, STOP_BIT);
    signal state : state_type := IDLE;

    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal bit_count : integer range 0 to 7 := 0;

begin

    process(clk, reset)
    begin
        if reset = '1' then

            state <= IDLE;
            shift_reg <= (others => '0');
            data_out <= (others => '0');
            rx_done <= '0';
            bit_count <= 0;

        elsif rising_edge(clk) then

            rx_done <= '0';

            if baud_tick = '1' then

                case state is

                   when IDLE =>

    if rx = '0' then
        bit_count <= 0;
        shift_reg <= (others => '0');
        state <= DATA_BITS;
    end if;

                   when DATA_BITS =>

    shift_reg(bit_count) <= rx;

    if bit_count = 7 then
        state <= STOP_BIT;
    else
        bit_count <= bit_count + 1;
    end if;
                    when STOP_BIT =>

    data_out <= shift_reg;
    rx_done <= '1';

    bit_count <= 0;
    state <= IDLE;
                end case;

            end if;

        end if;

    end process;

end Behavioral;