part of Babylon;

@JS()
class Promise<T> {
    external Promise(void executor(void resolve(T result), Function reject));
    external Promise<T> then(void onFulfilled(T result), [Function onRejected]);
}