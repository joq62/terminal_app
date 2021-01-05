all:
	erlc -o ebin src/*.erl;
	rm -rf ebin/* src/*.beam *.beam ebin/* 1_ebin/* 2_ebin/*;
	rm -rf  *~ */*~  erl_cra* *.log;
	echo Done
doc_gen:
	echo glurk not implemented
1_log_terminal:
	rm -rf 1_ebin/* src/*.beam *.beam;
	rm -rf  *~ */*~  erl_cra*;
#	common
	erlc -o 1_ebin ../../services/common_src/src/*.erl;
#	application gen_server
	erlc -o 1_ebin ../../services/terminal_src/src/*.erl;
#	application 
	cp src/*.app 1_ebin;
	erlc -o 1_ebin src/*.erl;
	erl -pa 1_ebin -run terminal boot_app -sname 1_log_terminal -setcookie abc
2_log_terminal:
	rm -rf 2_ebin/* src/*.beam *.beam;
	rm -rf  *~ */*~  erl_cra*;
#	common
	erlc -o 2_ebin ../../services/common_src/src/*.erl;
#	application gen_server
	erlc -o 2_ebin ../../services/terminal_src/src/*.erl;
#	application 
	cp src/*.app 2_ebin;
	erlc -o 2_ebin src/*.erl;
	erl -pa 2_ebin -run terminal boot_app -sname 2_log_terminal -setcookie abc
test:
	rm -rf ebin/* src/*.beam *.beam;
	rm -rf  *~ */*~  erl_cra*;
#	common
	erlc -o ebin ../../services/common_src/src/*.erl;
#	application gen_server
	erlc -o ebin ../../services/terminal_src/src/*.erl;
#	application 
	cp src/*.app ebin;
	erlc -o ebin src/*.erl;
	erl -pa ebin -s terminal_unit_tests start -sname terminal_test -setcookie abc
