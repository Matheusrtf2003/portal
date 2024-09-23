<?php
function compressCSS($css) {
    // Remove comentários
    $css = preg_replace('!/\*.*?\*/!s', '', $css);
    // Remove espaços em branco
    $css = preg_replace('/\s+/', ' ', $css);
    // Remove espaços em branco desnecessários
    $css = preg_replace('/;\s/', ';', $css);
    return $css;
}

function compressJS($js) {
    // Remove comentários
    $js = preg_replace('/\/\/[^\n]*/', '', $js);
    // Remove espaços em branco
    $js = preg_replace('/\s+/', ' ', $js);
    // Remove espaços em branco desnecessários
    $js = preg_replace('/;\s/', ';', $js);
    return $js;
}

function compressFiles($source, $destination, $type) {
    $content = file_get_contents($source);
    if ($type == 'css') {
        $content = compressCSS($content);
    } else if ($type == 'js') {
        $content = compressJS($content);
    }
    file_put_contents($destination, $content);
}

// Compressão dos arquivos CSS e JS
compressFiles('statics/css/style.css', 'statics/css/style.min.css', 'css');
compressFiles('statics/js/main.js', 'statics/js/main.min.js', 'js');
?>
