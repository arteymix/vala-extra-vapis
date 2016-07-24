/* Android Vala Bindings
 * Copyright 2016 Guillaume Poirier-Morency <guillaumepoiriermorency@gmail.com>
 */

[CCode (cprefix = "A")]
namespace Android
{
	[CCode (cheader_filename = "android/native_window.h", has_type_id = false)]
	public struct NativeWindow {}
}
