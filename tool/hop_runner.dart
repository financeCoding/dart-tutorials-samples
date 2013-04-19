import 'dart:async';
import 'dart:io';
import 'package:web_ui/component_build.dart' as web_ui;
import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';
// git -c diff.mnemonicprefix=false -c core.quotepath=false push -f -v origin gh-pages:gh-pages
void main() {
  _assertKnownPath();

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

  List buildWebUrls() {
    var urls = new List();

    urls.addAll(webUIFiles.map((String u) {
      List s = u.split('/');
      var last = s.removeLast();
      s.add('out');
      s.add(last);
      return s.join('/');
    }).toList());

    urls.addAll(files.map((String u) => u.replaceAll('.dart', '.html')).toList());

    return urls;
  }


  writeIndexFile() {
    StringBuffer sb = new StringBuffer();
    sb.write(
"""
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>Clickme</title>
    <link rel="stylesheet" href="clickme.css">
  </head>
  <body>
""");

    buildWebUrls()
    ..sort()
    ..forEach((u) {
      sb.writeln("<a href='$u'>$u</a><br>");
    });

    sb.write(
"""  </body>
</html>
""");

    File indexFile = new File('${deployFolderName}/index.html');
    indexFile.writeAsStringSync(sb.toString());
  }

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
          // rsync -RLrk --include "*/" --include="packages/browser/dart.js"  --exclude "packages/***" --verbose web /tmp/bbb
          //startProcess(ctx, 'rsync', ['-RLr', 'web', deployFolderName]).then((rsync_result) {
          startProcess(ctx, 'rsync', ['-RLrk',
                                      '--include=*/',
                                      '--include=packages/browser/dart.js',
                                      '--exclude=packages/***',
                                      '--verbose',
                                      'web', deployFolderName]).then((rsync_result) {

                                      //  return;
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

                var filesToProcess = new List();
                result.forEach((o) => filesToProcess.addAll(o.outputs.keys.where((f) => f.endsWith("_bootstrap.dart"))));
                dart2WebUI(ctx, filesToProcess).then((dart2WebUI_results) {
                  writeIndexFile();
                  completer.complete(true);
                });
              });
            });
          });
        });

    return completer.future;
  });

  // TODO: rename 'hop_gh_pages' to 'master' and make sure that 'deploy' has been checked into the repo.
  // dart tool/hop_runner.dart --log-level all --allow-dirty
  addAsyncTask('pages', (ctx) => branchForDir(ctx, 'hop_gh_pages', 'deploy', 'gh-pages'));
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