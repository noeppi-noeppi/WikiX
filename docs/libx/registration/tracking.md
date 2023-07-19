# Registry Tracking

Registry Tracking is the process of keeping your fields updated with the current value from the registry.
This also works with `final` fields.
To add a field to the registry tracker, use `RegistryTracker#track`.
This works for both static and instance fields.

All fields registered by [ModInit](../modinit/registration.md) will be added to the registry tracker automatically and `Registerable#initTracking` will be called on all registered elements.

If you want to disable registry tracking, call `disableRegistryTracking` in your `initRegistration` method.
