LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Modified_sseg IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        leds : OUT STD_LOGIC_VECTOR(0 TO 7)
    );
END Modified_sseg;

ARCHITECTURE Behavior OF Modified_sseg IS
BEGIN
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
                                                -- abcdefg (reversed display)
            WHEN "1111" => leds <= "01000100";  -- y  odd reversed
            WHEN "0000" => leds <= "00001001";  -- -n even reversed
            WHEN OTHERS => leds <= "11111111";  -- Clear or turn off all segments (all 1s)
        END CASE;
    END PROCESS;
END Behavior;