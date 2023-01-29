# [TEAM R] FREEZE Flutter App

이 Repository는 "예시 해커톤 제출 프로젝트" 의 네이티브 앱을 담당하는 Repository 입니다.

다음과 같은 기능이 포함되어 있습니다.

- 해커톤을 전국 대학(원)생들에게 홍보
- 참가자들에게 해커톤을 참가해야 함을 각인시기키

## 프로젝트에서 사용한 기술

본 Repository는 `pubspec.yaml`에 있는 오픈소스 패키지를 사용하였습니다.

또 다음 Code Snippet이 포함되어 있습니다.

- [Example Flutter Camera App](https://blog.logrocket.com/flutter-camera-plugin-deep-dive-with-examples/)

다양한 Component를 활용하여 UX를 높였습니다.

## Dev Env.

| Target   | Version |
| -------- | ------- |
| Flutter  | 3.7.0   |
| Dart     | 2.19.0  |
| DevTools | 2.20.1  |

## Dev Server 실행 방법

### VSCODE

`Android Emulator를 기준으로 개발되었습니다.`

`iOS Emulator를 이용하여 실행 시, 오류가 발생할 수 있습니다.`

1. 본 Repository를 로컬 환경에 Clone 받습니다.
2. VSCode Extension 중 `Flutter` , `Dart`를 설치합니다.
3. `Ctrl + F5` 또는 `Run -> Run Without Debugging`을 통해 Emulator를 실행합니다.
   (Emulator 실행 중 `Error: Cannot run with sound null safety, because the following dependencies
don't support null safety: ` 관련 에러 발생 시, `Visual Studio Code → Preferences → Settings → Search setting, type in "flutter test" → Dart: Flutter Test Additional Args, Add item → Add "--no-sound-null-safety"` 과정을 거친 후 재 실행 바랍니다.)
4. 초기 로그인 화면은 인증/인가 로직이 포함되어 있지 않으므로, 로그인 버튼을 누르고 매인화면으로 이동합니다.

## Production 배포 방법

본 프로젝트는 구글 플레이 또는 앱스토어에 배포하지 않았습니다.

## 환경 변수 및 시크릿

Dart 3의 null safety 를 Not Support하는 Package들은 다음과 같습니다.

- package:naver_map_plugin
- package:http
- package:http_parser

따라서 `Visual Studio Code → Preferences → Settings → Search setting, type in "flutter test" → Dart: Flutter Test Additional Args, Add item → Add "--no-sound-null-safety"`을 거쳐야 합니다.
