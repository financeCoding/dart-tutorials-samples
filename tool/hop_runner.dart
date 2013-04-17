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

  // Call the publish gh-pages branch from hop.
  addAsyncTask('deploy_gh_pages', (ctx) => branchForDir(ctx, 'master', 'output', 'gh-pages'));
}

void _assertKnownPath() {
  // since there is no way to determine the path of 'this' file
  // assume that Directory.current() is the root of the project.
  // So check for existance of /bin/hop_runner.dart
  final thisFile = new File('tool/hop_runner.dart');
  assert(thisFile.existsSync());
}