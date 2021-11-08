# flutter_gradient_test_mac

Shows how the output `flutter test` is visibly different for gradient across AMD64 and ARM64 Docker containers on Mac.

# How to run

```
docker build -t flutter-2.5.3 docker

docker run --rm -v $(pwd):/app flutter-2.5.3
```