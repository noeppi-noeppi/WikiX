# Registry Tracking

Registry Tracking is the process of keeping your fields updated with the current value from the registry.
This also works with `final` fields.
To add a field to the registry tracker, use `RegistryTracker#track`.
This works for both static and instance fields.

To systematically use registry tracking, there is a method named `enableRegistryTracking` that can be called in `initRegistration`.
This will cause all fields registered by [ModInit](../modinit/registration.md) to be added to the registry tracker and will cause `Registerable#initTracking` to be called, whenever a `Registerable` is registered, so registered objects can add their child objects to the tracker as well.
