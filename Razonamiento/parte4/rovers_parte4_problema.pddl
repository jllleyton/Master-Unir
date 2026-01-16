(define (problem roverprob1234)
	(:domain Rover-battery)
	(:objects
		general - Lander
		colour high_res low_res - Mode
		rover0 rover1 - Rover
		rover0store - Store
		waypoint0 waypoint1 waypoint2 waypoint3 - Waypoint
		camera0 - Camera
		objective0 objective1 - Objective
		b0 b1 b2 b3 b4 b5 - Blevel
		bat0 bat1 - Battery
		ruedas oruga patas - traccion ; Nuevo tipo traccion
		pendiente rocoso llano arenoso - camino ; Nuevo tipo de camino
		)
	(:init
		(visible waypoint1 waypoint0)
		(visible waypoint0 waypoint1)
		(visible waypoint2 waypoint0)
		(visible waypoint0 waypoint2)
		(visible waypoint2 waypoint1)
		(visible waypoint1 waypoint2)
		(visible waypoint3 waypoint0)
		(visible waypoint0 waypoint3)
		(visible waypoint3 waypoint1)
		(visible waypoint1 waypoint3)
		(visible waypoint3 waypoint2)
		(visible waypoint2 waypoint3)
		; Tipo de camino
		(type_path waypoint1 waypoint0 pendiente)
		(type_path waypoint0 waypoint1 pendiente)
		(type_path waypoint2 waypoint0 rocoso)
		(type_path waypoint0 waypoint2 rocoso)
		(type_path waypoint2 waypoint1 llano)
		(type_path waypoint1 waypoint2 llano)
		(type_path waypoint3 waypoint0 arenoso)
		(type_path waypoint0 waypoint3 arenoso)
		(type_path waypoint3 waypoint1 arenoso)
		(type_path waypoint1 waypoint3 arenoso)
		(type_path waypoint3 waypoint2 rocoso)
		(type_path waypoint2 waypoint3 rocoso)

		(at_soil_sample waypoint0)
		(at_rock_sample waypoint1)
		(at_soil_sample waypoint2)
		(at_rock_sample waypoint2)
		(at_soil_sample waypoint3)
		(at_rock_sample waypoint3)
		(at_lander general waypoint0)
		(channel_free general)
		(at rover0 waypoint3)
		(at rover1 waypoint0)
		(available rover0)
		(available rover1)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)
		; El rover equipa la traccion
		(equipped ruedas rover0)
		(equipped ruedas rover1)
		(equipped oruga rover1)
		(equipped patas rover1)
		; el tipo de camino necesita la traccion
		(need pendiente ruedas)
		(need rocoso patas)
		(need arenoso oruga)
		(need llano ruedas)
		(need llano patas)
		(need llano oruga)
		(on_board camera0 rover0)
		(calibration_target camera0 objective1)
		(supports camera0 colour)
		(supports camera0 high_res)
		; Bateria cargada en rover 0
		(battery_installed rover0 bat0 b4 b4)
		; Bateria cargada en rover 1
		(battery_installed rover1 bat1 b5 b5)
		; Niveles de bateria
		(lower b0 b1)
		(lower b1 b2)
		(lower b2 b3)
		(lower b3 b4)
		(lower b4 b5)
		; Visibilidad de objetivos
		(visible_from objective0 waypoint0)
		(visible_from objective0 waypoint1)
		(visible_from objective0 waypoint2)
		(visible_from objective0 waypoint3)
		(visible_from objective1 waypoint0)
		(visible_from objective1 waypoint1)
		(visible_from objective1 waypoint2)

	)

	(:goal
		(and
			(communicated_soil_data waypoint2)
			(communicated_rock_data waypoint3)
			(communicated_image_data objective1 high_res)
		)
	)
)