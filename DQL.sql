DELIMITER //

CREATE TRIGGER trg_log_cambio_precio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    -- Valida explícitamente que el precio haya cambiado
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO historial_precios (producto_id, precio_anterior, precio_nuevo)
        VALUES (OLD.id, OLD.precio, NEW.precio);
    END IF;
END //

DELIMITER ;



21:23:27	CREATE TRIGGER trg_log_cambio_precio AFTER UPDATE ON productos FOR EACH ROW BEGIN     
-- Valida explícitamente que el precio haya cambiado     IF OLD.precio <> NEW.precio THEN         
INSERT INTO historial_precios (producto_id, precio_anterior, precio_nuevo)        
 VALUES (OLD.id, OLD.precio, NEW.precio)	
 Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to 
 your MySQL server version for the right syntax to use near '' at line 8	0.00071 sec