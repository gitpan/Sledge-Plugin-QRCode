use ExtUtils::MakeMaker;
WriteMakefile(
        'NAME'         => 'Sledge::Plugin::QRCode',
        'VERSION_FROM' => 'lib/Sledge/Plugin/QRCode.pm', # finds $VERSION
        'PREREQ_PM'    => {
                Test::More  => 0.32,
                GD::Barcode => 1.15,
        },
);
