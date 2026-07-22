library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        baud_tick : in  STD_LOGIC;
        tx_start  : in  STD_LOGIC;
        data_in   : in  STD_LOGIC_VECTOR(7 downto 0);
        tx        : out STD_LOGIC;
        tx_done   : out STD_LOGIC
    );
end uart_tx;

architecture Behavioral of uart_tx is

    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
    signal state : state_type := IDLE;

    signal tx_reg    : STD_LOGIC := '1';
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal bit_count : integer range 0 to 7 := 0;

begin

    tx <= tx_reg;

    process(clk, reset)
    begin
        if reset = '1' then

            state <= IDLE;
            tx_reg <= '1';
            tx_done <= '0';
            shift_reg <= (others => '0');
            bit_count <= 0;

        elsif rising_edge(clk) then

            tx_done <= '0';

            if baud_tick = '1' then

                case state is

                    when IDLE =>

    tx_reg <= '1';
    tx_done <= '0';

    if tx_start = '1' then
        shift_reg <= data_in;
        bit_count <= 0;
        state <= START_BIT;
    end if;

                    when START_BIT =>

                        tx_reg <= '0'; -- tx_done <= '0';
                        state <= DATA_BITS;

                   when DATA_BITS =>

    tx_reg <= shift_reg(0);

    if bit_count = 7 then
        state <= STOP_BIT;
    else
        shift_reg <= '0' & shift_reg(7 downto 1);
        bit_count <= bit_count + 1;
    end if;

when STOP_BIT =>

    tx_reg <= '1';
    tx_done <= '1'; 

    bit_count <= 0;
    state <= IDLE;
                end case;

            end if;

        end if;

    end process;

end Behavioral;