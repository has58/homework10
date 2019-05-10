
-- Author : Haider Ali Siddiquee
-- Date : 5/9/2019
-- UNIT_FULLADDER with algorithmic modeling--
Library IEEE;
Use IEEE.std_logic_1164.ALL;
Entity fulladder_HW5_algo is
	port(
		in_a, in_b, in_c : in std_logic;
		out_sum, out_c : out std_logic);
	end fulladder_HW5_algo;


Architecture fulladder_HW5_algo_arch of fulladder_HW5_algo is
	begin
		process(in_a, in_b, in_c) is
			begin
				if (in_a = in_c) then
					out_sum <= in_b;
					out_c <= in_c;
				else
					out_sum <= not in_b;
					out_c <= in_b;
				end if;
		end process;
	end fulladder_HW5_algo_arch;