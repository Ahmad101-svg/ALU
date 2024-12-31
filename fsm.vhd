LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fsm IS
    port (
        data_in   : in  std_logic;
        clk       : in  std_logic;
        reset     : in  std_logic;
        student_id : out std_logic_vector(3 downto 0);
        current_state : out std_logic_vector(3 downto 0)
    );
end fsm;

architecture fsm of fsm is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
    signal yfsm : state_type;
begin

    -- Process for state transitions
    process (clk, reset)
    begin
        if reset = '1' then
            yfsm <= s0;
        elsif (clk'EVENT AND clk = '1') then
            case yfsm is
                when s0 =>
                    case data_in is
                        when '0' => yfsm <= s0;
when '1' => yfsm <= s1;
end case;
                when s1 =>
case data_in is
                        when '0' => yfsm <= s1;
when '1' => yfsm <= s2;
end case;

                when s2 =>
case data_in is
                        when '0' => yfsm <= s2;
when '1' => yfsm <= s3;
end case;

                when s3 =>
case data_in is
                        when '0' => yfsm <= s3;
when '1' => yfsm <= s4;
end case;

                when s4 =>
case data_in is
                        when '0' => yfsm <= s4;
when '1' => yfsm <= s5;
end case;

                when s5 =>
case data_in is
                        when '0' => yfsm <= s5;
when '1' => yfsm <= s6;
end case;

                when s6 =>
case data_in is
                        when '0' => yfsm <= s6;
when '1' => yfsm <= s7;
end case;

                when s7 =>
case data_in is
                        when '0' => yfsm <= s7;
when '1' => yfsm <= s0;
end case;

            end case;
        end if;
    end process;

    -- Process for output assignments
    process (yfsm)
    begin
        case yfsm is
            when s0 =>
                current_state <= "0000";
                student_id <= "0000"; -- d2
            when s1 =>
                current_state <= "0001";
                student_id <= "0001"; -- d3
            when s2 =>
                current_state <= "0010";
                student_id <= "0010"; -- d4
            when s3 =>
                current_state <= "0011";
                student_id <= "0010"; -- d5
            when s4 =>
                current_state <= "0100";
                student_id <= "0100"; -- d6
            when s5 =>
                current_state <= "0101";
                student_id <= "0100"; -- d7
            when s6 =>
                current_state <= "0110";
                student_id <= "0011"; -- d8
            when s7 =>
                current_state <= "0111";
                student_id <= "0111"; -- d9
        end case;
    end process;

end fsm;

	
