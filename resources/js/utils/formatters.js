/*
* @description Archivo de ayuda para formatear datos de la base de datos 
* y mostrar en vistas .vue
* @author Tony
* @version 1.0.0
* @date 18/08/2025
*/
/**
 * Formatea una fecha de entrada a un formato específico con el separador indicado.
 * @param {String} dateString - Fecha en formato 'YYYY-MM-DD', 'DD/MM/YYYY' o 'DD-MM-YYYY'
 * @param {String} separator - Separador de salida ('/' o '-')
 * @returns {String} Fecha formateada o cadena vacía si no es válida
 */
export const formatDateToDMY = (dateString, separator = '/') => {
    // Si no se proporciona una fecha, devolver cadena vacía
    if (!dateString) return '';

    // Expresión regular para validar los formatos de fecha aceptados:
    // - YYYY-MM-DD (ISO)
    // - DD/MM/YYYY
    // - DD-MM-YYYY
    const dateRegex = /^(\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]))|((0[1-9]|[12][0-9]|3[01])[\/-](0[1-9]|1[0-2])[\/-]\d{4})$/;
    
    // Validar el formato de la fecha con la expresión regular
    if (!dateRegex.test(dateString)) {
        console.error('Formato de fecha inválido');
        return '';
    }
    try {
        let day, month, year;
        
        // Determinar el formato de la fecha y extraer día, mes y año
        if (dateString.includes('-') && dateString.match(/-/g).length === 2) {
            // Formato YYYY-MM-DD
            [year, month, day] = dateString.split('-').map(Number);
        } else {
            // Formato DD/MM/YYYY o DD-MM-YYYY
            const sep = dateString.includes('/') ? '/' : '-';
            [day, month, year] = dateString.split(sep).map(Number);
        }
        
        // Validar si la fecha es real (días en mes, años bisiestos, etc.)
        if (!isValidDate(day, month, year)) {
            console.error('Fecha no válida');
            return '';
        }
        // Función auxiliar para agregar ceros a la izquierda si es necesario
        const pad = n => n < 10 ? `0${n}` : n;
        
        // Devolver la fecha formateada con el separador especificado
        return `${pad(day)}${separator}${pad(month)}${separator}${year}`;
    } catch (error) {
        // Manejar cualquier error inesperado durante el procesamiento
        console.error('Error al formatear la fecha:', error);
        return '';
    }
};

 /**
 * Valida si una fecha es válida (incluyendo días en meses y años bisiestos)
 * @param {number} day - Día del mes
 * @param {number} month - Mes (1-12)
 * @param {number} year - Año (4 dígitos)
 * @returns {boolean} true si la fecha es válida
 */
const isValidDate = (day, month, year) => {
    // Ajustar mes (JavaScript cuenta meses desde 0-11)
    const date = new Date(year, month - 1, day);
    return (
        date.getFullYear() === year &&
        date.getMonth() === month - 1 &&
        date.getDate() === day
    );
};