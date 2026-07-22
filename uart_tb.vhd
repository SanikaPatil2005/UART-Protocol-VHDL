library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_tb is
end uart_tb;

architecture Behavioral of uart_tb is

    component uart_top
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            tx_start : in  STD_LOGIC;
            data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
            tx       : out STD_LOGIC;
            data_out : out  STD_LOGIC_VECTOR(7 downto 0);
            tx_done  : out  STD_LOGIC;
            rx_done  : out  STD_LOGIC
        );
    end component;

    signal clk      : STD_LOGIC := '0';
    signal reset    : STD_LOGIC := '1';
    signal tx_start : STD_LOGIC := '0';
    signal data_in  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal tx       : STD_LOGIC;
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);
    signal tx_done  : STD_LOGIC;
    signal rx_done  : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin

    DUT : uart_top
        port map (
            clk      => clk,
            reset    => reset,
            tx_start => tx_start,
            data_in  => data_in,
            tx       => tx,
            data_out => data_out,
            tx_done  => tx_done,
            rx_done  => rx_done
        );

    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stimulus : process
    begin

        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        wait for 200 us;

        data_in <= x"AA";
        tx_start <= '1';
        wait for 250 us;
        tx_start <= '0';

        wait for 3 ms;

        wait;

    end process;

end Behavioral;