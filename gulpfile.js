const gulp = require('gulp');
const cleanCSS = require('gulp-clean-css');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');

// Minificar CSS
gulp.task('minify-css', () => {
    return gulp.src('statics/css/*.css')
        .pipe(cleanCSS({ compatibility: 'ie8' }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest('statics/css'));
});

// Minificar JS
gulp.task('minify-js', () => {
    return gulp.src('statics/js/*.js')
        .pipe(uglify())
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest('statics/js'));
});

// Tarefa padrão
gulp.task('default', gulp.series('minify-css', 'minify-js'));
