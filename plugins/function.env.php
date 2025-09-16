<?php

function smarty_function_env($params) {
    // Check if the key is provided
    if (!isset($params['key'])) {
        return 'Error: No key provided!';
    }

    $key = trim($params['key']);
    $envFile = _PS_THEME_DIR_ . '/.env';

    if (!file_exists($envFile)) {
        return 'Error: .env file not found!';
    }

    $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    foreach ($lines as $line) {
        if (strpos($line, '#') === 0) {
            continue; // Skip comments
        }

        list($envKey, $envValue) = explode('=', $line, 2);
        if (trim($envKey) === $key) {
            return trim($envValue);
        }
    }

    return "Error: Key '{$key}' not found!";
}
