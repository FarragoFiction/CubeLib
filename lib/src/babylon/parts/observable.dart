part of Babylon;

// ### Observable<T> ##############################


/// The Observable class is a simple implementation of the Observable pattern.
/// 
/// There's one slight particularity though: a given Observable can notify its observer using a particular mask value, only the Observers registered with this mask value will be notified.
/// This enable a more fine grained execution without having to rely on multiple different Observable objects.
/// For instance you may have a given Observable that have four different types of notifications: Move (mask = 0x01), Stop (mask = 0x02), Turn Right (mask = 0X04), Turn Left (mask = 0X08).
/// A given observer can register itself with only Move and Stop (mask = 0x03), then it will only be notified when one of these two occurs and will never be for Turn Left/Right.
@JS()
class Observable<T> {
	external Observable([dynamic onObserverAdded]);

	// ### Member Methods ##############################

	/// Create a new Observer with the specified callback
	external Observer<T> add(dynamic callback, [num mask, bool insertFirst, dynamic scope, bool unregisterOnFirstCall]);

	/// Create a new Observer with the specified callback and unregisters after the next notification
	external Observer<T> addOnce(dynamic callback);

	/// Clear the list of observers
	external void clear();

	/// Clone the current observable
	external Observable<T> clone();

	/// Gets a boolean indicating if the observable has at least one observer
	external bool hasObservers();

	/// Does this observable handles observer registered with a given mask
	external bool hasSpecificMask([num mask]);

	/// Notify a specific observer
	external void notifyObserver(Observer<T> observer, T eventData, [num mask]);

	/// Notify all Observers by calling their respective callback with the given data
	/// Will return true if all observers were executed, false if an observer set skipNextObservers to true, then prevent the subsequent ones to execute
	external bool notifyObservers(T eventData, [num mask, dynamic target, dynamic currentTarget]);

	/// Calling this will execute each callback, expecting it to be a promise or return a value.
	/// If at any point in the chain one function fails, the promise will fail and the execution will not continue.
	/// This is useful when a chain of events (sometimes async events) is needed to initialize a certain object
	/// and it is crucial that all callbacks will be executed.
	/// The order of the callbacks is kept, callbacks are not executed parallel.
	external Promise<T> notifyObserversWithPromise(T eventData, [num mask, dynamic target, dynamic currentTarget]);

	/// Remove an Observer from the Observable object
	external bool remove(Observer<T> observer);

	/// Remove a callback from the Observable object
	external bool removeCallback(dynamic callback, [dynamic scope]);

}

// ### Observer<T> ##############################


/// Represent an Observer registered to a given Observable object.
@JS()
class Observer<T> {
	external Observer(dynamic callback, num mask, [dynamic scope]);

	// ### Member Fields ##############################

	/// Defines the callback to call when the observer is notified
	external dynamic get callback;
	external void set callback(dynamic val);

	/// Defines the mask of the observer (used to filter notifications)
	external num get mask;
	external void set mask(num val);

	/// Defines the current scope used to restore the JS context
	external dynamic get scope;
	external void set scope(dynamic val);

	/// Gets or sets a property defining that the observer as to be unregistered after the next notification
	external bool get unregisterOnNextCall;
	external void set unregisterOnNextCall(bool val);

}


