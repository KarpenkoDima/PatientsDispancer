// JavaScript для работы с модальными окнами CustomerDetails

// Инициализация модальных окон Bootstrap

// Объявляем переменную глобально, но не инициализируем сразу
let customerModal;

// Скрываем ошибку при наличии ввода в любое поле формы
document.addEventListener('DOMContentLoaded', function () {
    // Инициализируем модальное окно только когда DOM готов
    const modalElement = document.getElementById('customerModal');
    if (modalElement) {
        customerModal = new bootstrap.Modal(modalElement);
        console.log('Модальное окно инициализировано');
    }
});

// ============================================================================
// РАБОТА С ПАЦИЕНТАМИ (CUSTOMER)
// ============================================================================

/**
 * Открывает модальное окно для редактирования пациента
 * @param {number} customerId - ID пациента для редактирования
 */
async function editCustomer(customerId) {
    try {
        // Получаем данные пациента с сервера
        const response = await fetch(`/CustomerDetails/${customerId}?handler=GetCustomer`);

        if (!response.ok) {
            throw new Error('Ошибка загрузки данных пациента');
        }

        const customer = await response.json();

        // Заполняем форму данными
        document.getElementById('customerId').value = customer.customerID;
        document.getElementById('lastName').value = customer.lastName || '';
        document.getElementById('firstName').value = customer.firstName || '';
        document.getElementById('middleName').value = customer.middleName || ''
        document.getElementById('birthday').value = customer.birthday ? customer.birthday.split('T')[0] : '';
        document.getElementById('medCard').value = customer.medCard || ''
        document.getElementById('codeCustomer').value = customer.codeCustomer || '';

        // Меняем заголовок модального окна
        document.getElementById('customerModalTitle').textContent = 'Редактирование пациента';

        // Сохраняем сообщение об ошибке
        document.getElementById('customerFormError').style.display = 'none';

        // Показываем модальное окно
        customerModal.show();

    } catch (error) {
        console.error('Ошибка при загрузке данных пациента: ', error);
        alert('Ошибка при загрузке данных пациента. Попробуй еще раз');
    }
}

