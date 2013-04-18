import 'dart:async';
import 'dart:io';
import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';

void main() {
  _assertKnownPath();

  // All pubspec files should install the dependencies.

  // Build all dart2js and dart2dart versions of target<X>/<sample_name>/web/

  // If the project has web components then call build.dart

  // Copy the files from the web folders to output/target<X>/<sample_name>/web/
  //addAsyncTask('deploy', (ctx) => startProcess(ctx, 'rsync', ['-RLr', 'web', 'output/']));
  // Call the publish gh-pages branch from hop.
  //addAsyncTask('deploy_gh_pages', (ctx) => branchForDir(ctx, 'master', 'output/web', 'gh-pages'));

  // TODO: add a future wait all tasks

  String deployFolderName = 'deploy';

  addAsyncTask('deploy', (ctx) => startProcess(ctx, 'rsync', ['-Rr', 'web', deployFolderName]));

  addTask('dart2js',
      createDart2JsTask(['web/target01/clickme/web/clickme.dart'],
      output: '${deployFolderName}/web/target01/clickme/web/clickme.dart.js',
      minify: true,
      liveTypeAnalysis: true,
      rejectDeprecatedFeatures: true));

  addAsyncTask('dart2js_dart',
      (ctx) =>
          startProcess(ctx,
              'dart2js',
              ['--output-type=dart',
               '--minify',
               '-o${deployFolderName}/web/target01/clickme/web/clickme.dart',
               'web/target01/clickme/web/clickme.dart']));

  addAsyncTask('deploy_gh_pages', (ctx) => branchForDir(ctx, 'master', 'deploy', 'gh-pages'));
  addAsyncTask('clean', (ctx) => startProcess(ctx, 'rm', ['-rf', deployFolderName]));

  runHop();
}

void _assertKnownPath() {
  // since there is no way to determine the path of 'this' file
  // assume that Directory.current() is the root of the project.
  // So check for existance of /bin/hop_runner.dart
  final thisFile = new File('tool/hop_runner.dart');
  assert(thisFile.existsSync());
}