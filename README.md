mongoid-multiple-polymorphic
============================

Support backward compatibility for multiple polymorphic relationships for mongoid 4

In mongoid 4, a model can no longer have more than 1 field with the same polymorphic class. This brings back the functionality to allow a smooth transition from mongoid 3 to mongoid 4.

Usage:

has_one :icon, as: :assetable, class_name: 'Asset', dependent: :destroy, autosave: true

has_one :preview, as: :assetable, class_name: 'Asset', dependent: :destroy, autosave: true

It will be saved in db as:

field: assetable_field

value: :icon

field: assetable_field

value: :preview
