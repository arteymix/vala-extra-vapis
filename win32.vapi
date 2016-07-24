/* win32 Vala Bindings
 * Coyright 2016 Guillaume Poirier-Morency <guillaumepoiriermorency@gmail>
 */

[CCode (cheader_filename = "windows.h")]
namespace Win32 {
	[CCode (has_type_id = false)]
	public struct HINSTANCE {}
	[CCode (has_type_id = false)]
	public struct HWND {}
}
