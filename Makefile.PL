use inc::Module::Install;

name 'App-jailing';
all_from 'jailing';
perl_version '5.8.8';

install_script 'jailing';

auto_include;
auto_install;

WriteAll;
