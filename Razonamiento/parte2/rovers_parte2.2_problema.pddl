(define (problem roverprob1234) (:domain Rover-battery)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 rover1 - Rover ; Un nuevo rover
	rover0store rover1store - Store ; Nuevo store para el nuevo rover
	waypoint0 waypoint1 waypoint2 waypoint3 - Waypoint
	camera0 - Camera
	objective0 objective1 - Objective
    b0 b1 b2 b3 b4 b5 - Blevel
    bat0 bat1 - Battery ; Nueva bateria para el nuevo rover
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
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint1)
	(at_soil_sample waypoint2)
	(at_rock_sample waypoint2)
	(at_soil_sample waypoint3)
	(at_rock_sample waypoint3)
	(at_lander general waypoint0)
	(channel_free general)
	(at rover0 waypoint3)
	(at rover1 waypoint0) ; Rover1 inicia en waypoint0
	(available rover0)
	(available rover1) ; Rover1 activo
	(store_of rover0store rover0)
	(store_of rover1store rover1) ; Asignar el store
	(empty rover0store)
	(empty rover1store) ; Indicar que esta vacio el nuevo store
	(equipped_for_soil_analysis rover0)
	(equipped_for_rock_analysis rover0)
	(equipped_for_imaging rover0)
		; Nuevo rober equipado para suelo y rocas
	(equipped_for_soil_analysis rover1)
	(equipped_for_rock_analysis rover1)
	(can_traverse rover0 waypoint3 waypoint0)
	(can_traverse rover0 waypoint0 waypoint3)
	(can_traverse rover0 waypoint3 waypoint1)
	(can_traverse rover0 waypoint1 waypoint3)
	(can_traverse rover0 waypoint1 waypoint2)
	(can_traverse rover0 waypoint2 waypoint1)
	; El nuevo rover puede moverse como el rover0
	(can_traverse rover1 waypoint3 waypoint0)
	(can_traverse rover1 waypoint0 waypoint3)
	(can_traverse rover1 waypoint3 waypoint1)
	(can_traverse rover1 waypoint1 waypoint3)
	(can_traverse rover1 waypoint1 waypoint2)
	(can_traverse rover1 waypoint2 waypoint1)
	(on_board camera0 rover0)
	(calibration_target camera0 objective1)
	(calibration_target camera0 objective0) ; Objetivo0 calibrar la camera
	(supports camera0 colour)
	(supports camera0 high_res)
	(supports camera0 low_res)
	; Bateria cargada en rover 0
	(battery_installed rover0 bat0 b4 b4)
	; Bateria cargada en rover 1
	(battery_installed rover1 bat1 b4 b4)
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
)

(:goal (and
   (communicated_soil_data waypoint2)
   (communicated_rock_data waypoint3)
   (communicated_image_data objective1 high_res)
   ; Nuevos objetivos
	(communicated_image_data objective1 low_res)
	(communicated_image_data objective1 colour)
	(communicated_image_data objective0 high_res)
	(communicated_image_data objective0 low_res)
	(communicated_image_data objective0 colour)
	(communicated_rock_data waypoint1)
	(communicated_soil_data waypoint0)
	(communicated_soil_data waypoint2)
   )
)
)