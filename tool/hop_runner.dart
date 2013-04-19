import 'dart:async';
import 'dart:io';
import 'package:web_ui/component_build.dart' as web_ui;
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

  String deployFolderName = 'deploy';

  List webUIFiles =         ['web/target06/littleben/web/littleben.html',
                             'web/target06/littleben_clock/web/littleben_clock.html',
                             'web/target06/shout/web/shout.html',
                             'web/target06/stopwatch/web/stopwatch.html',
                             'web/target07/adlibitum/web/adlibitum.html',
                             'web/target07/hangman/web/hangman.html',
                             'web/target07/simplehangman/web/simplehangman.html',
                             'web/target08/convertthis/web/convertThis.html',
                             'web/target08/drseuss/web/drseuss.html',
                             'web/target09/its_all_about_you/web/its_all_about_you.html'];

//  List webUIFilesBootstrap = ['web/target06/littleben/web/out/littleben.html_bootstrap.dart',
//                              'web/target06/littleben_clock/web/out/littleben_clock.html_bootstrap.dart',
//                              'web/target06/shout/web/out/shout.html_bootstrap.dart',
//                              'web/target06/stopwatch/web/out/stopwatch.html_bootstrap.dart',
//                              'web/target07/adlibitum/web/out/adlibitum.html_bootstrap.dart',
//                              'web/target07/hangman/web/out/hangman.html_bootstrap.dart',
//                              'web/target07/simplehangman/web/out/simplehangman.html_bootstrap.dart',
//                              'web/target08/convertthis/web/out/convertThis.html_bootstrap.dart',
//                              'web/target08/drseuss/web/out/drseuss.html_bootstrap.dart',
//                              'web/target09/its_all_about_you/web/out/its_all_about_you.html_bootstrap.dart'];

  List webUIArgs = ['--', '--no-rewrite-urls'];


  List files = ['web/target01/clickme/web/clickme.dart',
                //'web/target01/helloworld/bin/helloworld.dart',
                'web/target02/mini/web/mini.dart',
                'web/target02/mini_with_style/web/mini_with_style.dart',
                'web/target03/anagram/web/anagram.dart',
                'web/target03/todo/web/todo.dart',
                'web/target04/todo_with_delete/web/todo_with_delete.dart',
                'web/target09/portmanteaux/web/portmanteaux.dart',
                'web/target09/portmanteaux_simple/web/portmanteaux_simple.dart'
                ];


  // 1) build webui files
  // 2) deploy
  // 3) build dart2js
  // 4) build dart2dart
  // 5) create gh-pages

  //addAsyncTask('deploy', (ctx) => startProcess(ctx, 'rsync', ['-Rr', 'web', deployFolderName]));

//  addAsyncTask('dart2js',
//      (ctx) {
//
//    Completer completer = new Completer();
//
//    List dart2jsFiles = new List.from(files);
//
//    funcRun(List f) {
//      if (f.length == 0) {
//        completer.complete(true);
//        return;
//      }
//      var file = f.removeLast();
//      startProcess(ctx,
//          'dart2js',
//          ['--output-type=js',
//           '--verbose',
//           '--minify',
//           '-o${deployFolderName}/$file.js',
//           '$file']).then((r) {
//             if (r == false) {
//               print("failed on $file");
//             }
//
//             funcRun(f);
//           });
//    };
//
//    funcRun(dart2jsFiles);
//
//    return completer.future;
//  });


  Future<bool> dart2js(ctx) {

    Completer completer = new Completer();

    List dart2jsFiles = new List.from(files);

    funcRun(List f) {
      if (f.length == 0) {
        completer.complete(true);
        return;
      }
      var file = f.removeLast();
      startProcess(ctx,
          'dart2js',
          ['--output-type=js',
           '--verbose',
           '--minify',
           '-o${deployFolderName}/$file.js',
           '$file']).then((r) {
             if (r == false) {
               print("failed on $file");
             }

             funcRun(f);
           });
    };

    funcRun(dart2jsFiles);

    return completer.future;
  }

  Future<bool> dart2dart(ctx) {

    print("dart2dart");
    print("files = $files");
    Completer completer = new Completer();

    List dart2dartFiles = new List.from(files);
    print("dart2dartFiles = $dart2dartFiles");

    funcRun(List f) {
      print("f = $f");
      if (f.length == 0) {
        completer.complete(true);
        return;
      }
      var file = f.removeLast();
      startProcess(ctx,
          'dart2js',
          ['--output-type=dart',
           '--verbose',
           '--minify',
           '-o${deployFolderName}/$file',
           '$file']).then((r) {
             if (r == false) {
               print("failed on $file");
             }

             funcRun(f);
           });
    };

    print("dart2dartFiles = $dart2dartFiles");
    funcRun(dart2dartFiles);

    return completer.future;
  }


//  addAsyncTask('dart2dart',
//      (ctx) {
//
//    Completer completer = new Completer();
//
//    List dart2dartFiles = new List.from(files);
//
//    funcRun(List f) {
//      if (f.length == 0) {
//        completer.complete(true);
//        return;
//      }
//      var file = f.removeLast();
//      startProcess(ctx,
//          'dart2js',
//          ['--output-type=dart',
//           '--verbose',
//           '--minify',
//           '-o${deployFolderName}/$file',
//           '$file']).then((r) {
//             if (r == false) {
//               print("failed on $file");
//             }
//
//             funcRun(f);
//           });
//    };
//
//    funcRun(dart2dartFiles);
//
//    return completer.future;
//  });

  Future<bool> dart2WebUI(ctx, List bootstrapFiles) {
    var completer = new Completer();

    print("bootstrapFiles = ${bootstrapFiles}");

    funcRun(List f) {
      if (f.length == 0) {
        completer.complete(true);
        return;
      }
      var file = f.removeLast();
      startProcess(ctx,
          'dart2js',
          ['--output-type=dart',
           '--verbose',
           '--minify',
           '-o${deployFolderName}/$file',
           '$file']).then((r) {
             if (r == false) {
               print("failed on $file");
             }

             startProcess(ctx,
                 'dart2js',
                 ['--output-type=js',
                  '--verbose',
                  '--minify',
                  '-o${deployFolderName}/$file.js',
                  '$file']).then((r) {
                    if (r == false) {
                      print("failed on $file");
                    }

                    funcRun(f);
                  });
           });
    };

    funcRun(new List.from(bootstrapFiles));

    return completer.future;
  }

  addAsyncTask('build_gh_pages', (ctx) {
    var completer = new Completer();

    web_ui.build(webUIArgs, webUIFiles).then(
        (result) {
          startProcess(ctx, 'rsync', ['-RLr', 'web', deployFolderName]).then((rsync_result) {

            print("==========================================");
            print("rsync done");
            print("==========================================");
            dart2js(ctx).then((dart2js_result) {

              print("==========================================");
              print("dart2js done");
              print("==========================================");
              dart2dart(ctx).then((dart2dart_result) {

                print("==========================================");
                print("dart2dart done");
                print("==========================================");

                List filesToProcess = new List();
                result.forEach((o) => filesToProcess.addAll(o.outputs.keys.where((f) => f.endsWith("_bootstrap.dart"))));
                dart2WebUI(ctx, filesToProcess).then((dart2WebUI_results) {
                  completer.complete(true);
                });
              });
            });
          });
        });

    return completer.future;
  });

  // TODO: rename 'hop_gh_pages' to 'master' and make sure that 'deploy' has been checked into the repo.
  addAsyncTask('commit_gh_pages', (ctx) => branchForDir(ctx, 'hop_gh_pages', 'deploy', 'gh-pages'));
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