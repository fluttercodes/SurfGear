import 'package:ci/domain/element.dart';
import 'package:ci/exceptions/exceptions.dart';
import 'package:ci/tasks/impl/publish/pub_dry_run_task.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../core/test_helper.dart';

/// Тесты для [PubDryRunTask].
void main() {
  group(
    'PubDryRunTask tests:',
    () {
      test(
        'If the open source module and it can be published, it should return true.',
        () async {
          var task = _prepareTestTask(
            true,
            _openSourceTestElement(),
          );
          var actual = await task.run();

          expect(
            actual,
            isTrue,
          );
        },
      );

      test(
        'If the module is not open source, it should return false.',
        () async {
          var task = _prepareTestTask(
            true,
            createTestElement(),
          );
          var actual = await task.run();

          expect(
            actual,
            isFalse,
          );
        },
      );

      test(
        'Exception should be thrown when opensource module not ready to publish.',
        () async {
          var task = _prepareTestTask(
            false,
            _openSourceTestElement(),
          );

          expect(
            () async => await task.run(),
            throwsA(
              TypeMatcher<OpenSourceModuleCanNotBePublishException>(),
            ),
          );
        },
      );
    },
  );
}

PubDryRunTask _prepareTestTask(bool isError, Element element) {
  var callingMap = <String, dynamic>{
    'pub publish --dry-run': isError,
  };
  var shell = substituteShell(callingMap: callingMap);
  var shm = getTestShellManager();
  when(shm.copy(any)).thenReturn(shell);
  return PubDryRunTask(element);
}

Element _openSourceTestElement() => createTestElement(
      openSourceInfo: OpenSourceInfo(
        hostUrl: 'https://www.test.com/opensourceinfo',
        separateRepoUrl: 'https://pub.test/test/opensourceinfo',
      ),
    );
