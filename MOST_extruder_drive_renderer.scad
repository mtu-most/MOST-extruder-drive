/*
MOST-extruder_drive_renderer.scad is the rendering portion of the MOST extruder drive
Copyright (C) 2014 Gerald Anzalone

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

include<airtripper-extruder-gca.scad>

render_part(5);

// following set the dimensions for a given filament [d_retainer, h_retainer, d_sheath, d_filament, offset_filament]
filament300 = [d_M6_nut, h_M6_nut, 6.55, 3.4, 5.925];
filament175 = [d_M4_nut, h_M4_nut, 4.5, 2.1, 5.8]; //offset was 5.3 d_filament was 2.2
filament = filament175; // set to one of the two, above
d_retainer = filament[0]; // 1.75mm filament: M4, 3mm filament: M6
h_retainer = filament[1];
d_sheath = filament[2]; // 1.75mm filament: 4.5, 3mm filament: 6.55
d_filament = filament[3]; // 1.75mm filament: 2.2, 3mm filament: 3.4 
offset_filament = filament[4]; // 1.75mm filament: 5.3, 3mm filament: 5.925

module render_part(part_to_render) {
	if (part_to_render == 1) {
		extruder_block(
			d_retainer = d_retainer,
			h_retainer = h_retainer,
			d_sheath = d_sheath,
			d_filament = d_filament,
			t_feet = t_feet, 
			t_base = t_base,
			offset_filament = offset_filament);
	}

	if (part_to_render == 2) extruder_idler_608z();

	if (part_to_render == 3) support_strut();

	if (part_to_render == 4) axle_8mm(); 

	if (part_to_render == 5) {
		translate([0,-20,0])
			rotate([0,0,270])
				extruder_block(
					d_retainer = d_retainer,
					h_retainer = h_retainer,
					d_sheath = d_sheath,
					d_filament = d_filament,
					t_feet = t_feet, 
					t_base = t_base,
					offset_filament = offset_filament);

		translate([10, 10 + t_feet, 0]) rotate([0, 0, 90]) extruder_idler_608z();
		translate([10, 26 + t_feet, 0]) support_strut();
		translate([-16, 9 + t_feet, 0]) axle_8mm();
	} 

	if (part_to_render == 99) sandbox();
}
