use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => "App-jailing",
    EXE_FILES    => [ qw(jailing) ],
    VERSION_FROM => "jailing",
    EXE_FILES    => ["jailing"],
);
