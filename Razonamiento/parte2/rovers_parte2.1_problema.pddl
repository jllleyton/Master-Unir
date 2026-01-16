(define (problem roverprob1234) (:domain Rover-battery)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 - Rover
	rover0store - Store
	waypoint0 waypoint1 waypoint2 waypoint3 waypoint21 - Waypoint ; Nuevo waypoint
	camera0 - Camera
	objective0 objective1 - Objective
    b0 b1 b2 b3 b4 b5 - Blevel
    bat0 - Battery
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
   ; Conectado a dos waitpoint (0 y 1)
   	(visible waypoint21 waypoint0)
	(visible waypoint0 waypoint21)
	(visible waypoint21 waypoint1)
	(visible waypoint1 waypoint21)
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint1)
	(at_soil_sample waypoint2)
	(at_rock_sample waypoint2)
	(at_soil_sample waypoint3)
	(at_rock_sample waypoint3)
	; Nuevo waitpoint21 tiene muestras de solid y roca
	(at_soil_sample waypoint21)
	(at_rock_sample waypoint21)
	(at_lander general waypoint0)
	(channel_free general)
	(at rover0 waypoint3)
	(available rover0)
	(store_of rover0store rover0)
	(empty rover0store)
	(equipped_for_soil_analysis rover0)
	(equipped_for_rock_analysis rover0)
	(equipped_for_imaging rover0)
	(can_traverse rover0 waypoint3 waypoint0)
	(can_traverse rover0 waypoint0 waypoint3)
	(can_traverse rover0 waypoint3 waypoint1)
	(can_traverse rover0 waypoint1 waypoint3)
	(can_traverse rover0 waypoint1 waypoint2)
	(can_traverse rover0 waypoint2 waypoint1)
	; El rover puede ir a el nuevo waitpoint
	(can_traverse rover0 waypoint0 waypoint21)
	(can_traverse rover0 waypoint21 waypoint1)
	(on_board camera0 rover0)
	(calibration_target camera0 objective1)
	(supports camera0 colour)
	(supports camera0 high_res)
	; Bateria cargada en rover 0
	(battery_installed rover0 bat0 b4 b4)
	; Niveles de bateria
	(lower b0 b1) (lower b1 b2) (lower b2 b3) (lower b3 b4) (lower b4 b5)
	; Visibilidad de objetivos
	(visible_from objective0 waypoint0)
	(visible_from objective0 waypoint1)
	(visible_from objective0 waypoint2)
	(visible_from objective0 waypoint3)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective1 waypoint2)
    ; Los objectivos se vean desde el nuevo waitpoint
	(visible_from objective0 waypoint21)
	(visible_from objective1 waypoint21)

)

(:goal (and
   (communicated_soil_data waypoint2)
   (communicated_rock_data waypoint3)
   ; Nuevos objetivos
   (communicated_soil_data waypoint21)
   (communicated_rock_data waypoint21)
   (communicated_image_data objective1 high_res)
   (at rover0 waypoint1) ; El rover acabe en el waitpoint1
   )
)
)
