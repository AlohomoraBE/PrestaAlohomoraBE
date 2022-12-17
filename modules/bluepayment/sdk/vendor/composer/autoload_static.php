<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitd8919413a26a02da4342fc0626dc3f72
{
    public static $files = array (
        '7b11c4dc42b3b3023073cb14e519683c' => __DIR__ . '/..' . '/ralouphie/getallheaders/src/getallheaders.php',
        'e69f7f6ee287b969198c3c9d6777bd38' => __DIR__ . '/..' . '/symfony/polyfill-intl-normalizer/bootstrap.php',
        '023d27dca8066ef29e6739335ea73bad' => __DIR__ . '/..' . '/symfony/polyfill-php70/bootstrap.php',
        '25072dd6e2470089de65ae7bf11d3109' => __DIR__ . '/..' . '/symfony/polyfill-php72/bootstrap.php',
        'c964ee0ededf28c96ebd9db5099ef910' => __DIR__ . '/..' . '/guzzlehttp/promises/src/functions_include.php',
        'a0edc8309cc5e1d60e3047b5df6b7052' => __DIR__ . '/..' . '/guzzlehttp/psr7/src/functions_include.php',
        'f598d06aa772fa33d905e87be6398fb1' => __DIR__ . '/..' . '/symfony/polyfill-intl-idn/bootstrap.php',
        '37a3dc5111fe8f707ab4c132ef1dbc62' => __DIR__ . '/..' . '/guzzlehttp/guzzle/src/functions_include.php',
    );

    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Symfony\\Polyfill\\Php72\\' => 23,
            'Symfony\\Polyfill\\Php70\\' => 23,
            'Symfony\\Polyfill\\Intl\\Normalizer\\' => 33,
            'Symfony\\Polyfill\\Intl\\Idn\\' => 26,
        ),
        'P' => 
        array (
            'Psr\\Log\\' => 8,
            'Psr\\Http\\Message\\' => 17,
        ),
        'M' => 
        array (
            'Monolog\\' => 8,
        ),
        'G' => 
        array (
            'GuzzleHttp\\Psr7\\' => 16,
            'GuzzleHttp\\Promise\\' => 19,
            'GuzzleHttp\\' => 11,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Symfony\\Polyfill\\Php72\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-php72',
        ),
        'Symfony\\Polyfill\\Php70\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-php70',
        ),
        'Symfony\\Polyfill\\Intl\\Normalizer\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-intl-normalizer',
        ),
        'Symfony\\Polyfill\\Intl\\Idn\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-intl-idn',
        ),
        'Psr\\Log\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/log/Psr/Log',
        ),
        'Psr\\Http\\Message\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/http-message/src',
        ),
        'Monolog\\' => 
        array (
            0 => __DIR__ . '/..' . '/monolog/monolog/src/Monolog',
        ),
        'GuzzleHttp\\Psr7\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/psr7/src',
        ),
        'GuzzleHttp\\Promise\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/promises/src',
        ),
        'GuzzleHttp\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/guzzle/src',
        ),
    );

    public static $classMap = array (
        'ArithmeticError' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/ArithmeticError.php',
        'AssertionError' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/AssertionError.php',
        'BlueMedia\\OnlinePayments\\Action\\ITN\\Transformer' => __DIR__ . '/../..' . '/src/Action/ITN/Transformer.php',
        'BlueMedia\\OnlinePayments\\Action\\PaywayList\\Transformer' => __DIR__ . '/../..' . '/src/Action/PaywayList/Transformer.php',
        'BlueMedia\\OnlinePayments\\Gateway' => __DIR__ . '/../..' . '/src/Gateway.php',
        'BlueMedia\\OnlinePayments\\HttpClient\\CurtHttpClient' => __DIR__ . '/../..' . '/src/HttpClient/CurtHttpClient.php',
        'BlueMedia\\OnlinePayments\\HttpClient\\CurtHttpResponse' => __DIR__ . '/../..' . '/src/HttpClient/CurtHttpResponse.php',
        'BlueMedia\\OnlinePayments\\Model\\AbstractModel' => __DIR__ . '/../..' . '/src/Model/AbstractModel.php',
        'BlueMedia\\OnlinePayments\\Model\\Gateway' => __DIR__ . '/../..' . '/src/Model/Gateway.php',
        'BlueMedia\\OnlinePayments\\Model\\ItnIn' => __DIR__ . '/../..' . '/src/Model/ItnIn.php',
        'BlueMedia\\OnlinePayments\\Model\\PaywayList' => __DIR__ . '/../..' . '/src/Model/PaywayList.php',
        'BlueMedia\\OnlinePayments\\Model\\TransactionBackground' => __DIR__ . '/../..' . '/src/Model/TransactionBackground.php',
        'BlueMedia\\OnlinePayments\\Model\\TransactionInit' => __DIR__ . '/../..' . '/src/Model/TransactionInit.php',
        'BlueMedia\\OnlinePayments\\Model\\TransactionStandard' => __DIR__ . '/../..' . '/src/Model/TransactionStandard.php',
        'BlueMedia\\OnlinePayments\\Util\\EnvironmentRequirements' => __DIR__ . '/../..' . '/src/Util/EnvironmentRequirements.php',
        'BlueMedia\\OnlinePayments\\Util\\Formatter' => __DIR__ . '/../..' . '/src/Util/Formatter.php',
        'BlueMedia\\OnlinePayments\\Util\\HttpClient' => __DIR__ . '/../..' . '/src/Util/HttpClient.php',
        'BlueMedia\\OnlinePayments\\Util\\Logger' => __DIR__ . '/../..' . '/src/Util/Logger.php',
        'BlueMedia\\OnlinePayments\\Util\\Sorter' => __DIR__ . '/../..' . '/src/Util/Sorter.php',
        'BlueMedia\\OnlinePayments\\Util\\Translations' => __DIR__ . '/../..' . '/src/Util/Translations.php',
        'BlueMedia\\OnlinePayments\\Util\\Validator' => __DIR__ . '/../..' . '/src/Util/Validator.php',
        'BlueMedia\\OnlinePayments\\Util\\XMLParser' => __DIR__ . '/../..' . '/src/Util/XMLParser.php',
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
        'DivisionByZeroError' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/DivisionByZeroError.php',
        'Error' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/Error.php',
        'Normalizer' => __DIR__ . '/..' . '/symfony/polyfill-intl-normalizer/Resources/stubs/Normalizer.php',
        'ParseError' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/ParseError.php',
        'SessionUpdateTimestampHandlerInterface' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/SessionUpdateTimestampHandlerInterface.php',
        'TypeError' => __DIR__ . '/..' . '/symfony/polyfill-php70/Resources/stubs/TypeError.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitd8919413a26a02da4342fc0626dc3f72::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitd8919413a26a02da4342fc0626dc3f72::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitd8919413a26a02da4342fc0626dc3f72::$classMap;

        }, null, ClassLoader::class);
    }
}