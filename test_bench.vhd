-- Author: Haider Ali Siddiquee
-- date: 5/9/2019
-- file: test_bench


Library  Ieee;
use ieee.std_logic_1164.All;
use ieee.numeric_std.ALL;

Entity test_bench is
end entity;

Architecture tb_arch of test_bench is
	component unit_adder is
		port(
		in_a, in_b, in_c : in std_logic;
		out_sum, out_c : out std_logic);
	end component;
	for X1 : unit_adder use entity work.fulladder_HW5_algo(fulladder_HW5_algo_arch);
	signal a,b,c,sum,carry : std_logic;
	begin
		X1 : unit_adder port map ( a,b,c,sum,carry);
		process
			variable count : integer :=0;
			type  adder is record
				input_A, input_b, input_c, out_sum, out_cary : std_logic;
			end record;
			type test is array (natural range<>) of adder;
			constant checker : test :=(('0','0','0','0','0'),('0','0','1','1','0'),
					('0','1','0','1','0'), ('1','0','0','1','0'), 
					('1','1','0','0','1'),('1','0','1','0','1'),
					('0','1','1','0','1'),('1','1','1','1','1'));	
			begin
				for i in checker'range
					loop 
						a <= checker(i).input_A;
						b <= checker(i).input_b;
						c <= checker(i).input_c;
						wait for 100 ns;
						assert sum = checker(i).out_sum and carry = checker(i).out_cary 
							report "wrong ans. at i = " & integer'image(i)
								severity error;
						if (sum  /= checker(i).out_sum or  carry /= checker(i).out_cary) then
							count := count +1;
						end if;
					end loop;
				report "Total Number Of error = " & integer'image(count);
				if (count = 0) then
					report "Nice Job No Error";
				end if;
				wait;
			end process;
		
	end architecture;
	