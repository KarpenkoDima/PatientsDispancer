// JS для работы с модальным окном на Dashboard

/*
Почему это ломает скрипт:
Скрипт падает до загрузки функций: 
    1. Когда браузер читает ваш dashboard.js, он доходит до этой строки. 
       Если в этот момент DOM (само модальное окно с ID customerModal) еще не полностью отрисован или скрипт выполняется раньше, 
       чем HTML-код модалки, document.getElementById вернет null.

    2. Ошибка в конструкторе: Передача null в new bootstrap.Modal() вызывает ошибку, 
       которая прерывает выполнение всего остального скрипта. В итоге функции editCustomerInline
       и остальные просто не успевают зарегистрироваться в памяти браузера.

// инициализация модального окна на Bootstrap
const customerModal = new bootstrap.Modal(document.getElementById('customerModal'));
*/

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

    const form = document.getElementById('customerForm');
    if (form) {
        const inputs = form.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('input', hideError);
        });
    }
});

/*
* Открваем модальное окно для создания нового пациента
*/
function createCustomer() {
    const form = document.getElementById('customerForm');
    if (form) {
        form.reset();
    }

    // Очищаем форму
    document.getElementById('customerForm').reset();
    document.getElementById('customerId').value = '0';

    // Меняем заголовок модального окна
    document.getElementById('customerModalTitle').textContent = 'Новфй пациент';

    // Скрываем сообщение об ошибке
    document.getElementById('customerFormError').style.display = 'none';

    // Показываю модальное окно
    if (customerModal) {
        customerModal.show();
    }
}

/*
* Открываем модальное окно для редактирования пациента прямо на Dashboard
* @param {number} customerId - ID пациента для редактирования
*/
async function editCustomerInline(customerId) {
    console.log('Вызываем редактирование пациента с ID:',  customerId);

    try {
        
        // получаем данные пациента с сервера
        /* Razor Page URL: В editCustomerInline я изменил путь на /Dashboard?handler=Customer. 
           В Razor Pages обработчики вызываются через параметр handler.
        */
        const response = await fetch(`/Dashboard/?handler=Customer&id=${customerId}`);

        if (!response.ok) {
            throw new Error('Ошибка загрузки данных пациента');
        }

        const customer = await response.json();

        // Заполняю форму данными
        document.getElementById('customerId').value = customer.customerID;
        document.getElementById('lastName').value = customer.lastName || '';
        document.getElementById('firstName').value = customer.firstName || '';
        document.getElementById('middleName').value = customer.middleName || ''
        document.getElementById('birthday').value = customer.birthday ? customer.birthday.split('T')[0] : '';
        document.getElementById('medCard').value = customer.medCard || ''
        document.getElementById('codeCustomer').value = customer.codeCustomer || ''

        // Меняем заголовок модального окна
        document.getElementById('customerModalTitle').textContent = 'Редактирование пациента';

        // Скрываем сообщение об ошибке
        document.getElementById('customerFormError').style.display = 'none';

        // Показываю модальное окно
        customerModal.show();

    } catch (error) {
        console.error('Ошибка при загрузке данных пациента: ', error);
        alert('Ошибка при загрузке данных пациента. Попробуй снова.');
    }
}

/*
* Сохраняем данные пациента (создание или обновление)
* @param {Event} event - событие submit формы
*/
async function saveCustomer(event) {
    event.preventDefault();

    // Собираем данные из формы
    const formData = {
        customerId: parseInt(document.getElementById('customerId').value) || 0,
        lastName: document.getElementById('lastName').value.trim(),
        firstName: document.getElementById('firstName').value.trim(),
        middleName: document.getElementById('middleName').value.trim() || null,
        birthday: document.getElementById('birthday').value || null,
        medCard: parseInt(document.getElementById('medCard').value) || null,
        codeCustomer: parseInt(document.getElementById('codeCustomer').value) || null,
    };

    // Простая валидация на клиенте
    if (!formData.lastName || !formData.firstName) {
        showError('Фамилия и Имя обязательны для заполнения');
        return false;
    }

    try {
        // Отправляем данные на сервер
        const response = await fetch(`/Dashboard/?handler=SaveCustomer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'RequestVerificationToken': document.querySelector('input[name="__RequestVerificationToken"]')?.value || ''
            },
            body: JSON.stringify(formData)
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.message || 'Ошибка при сохранении данных');
        }

        const result = await response.json();

        // Закрываем модальное окно
        customerModal.hide();

        // Перезагружаем страницу для отображения обновленных данных
        window.location.reload();

    } catch (error) {
        console.error('Ошибка при сохранении данных: ', error);
        showError(error.message);
    }

    return false;
}

/*
* Показываем сообщение обшибке
*/
function showError(message) {
    const errorDiv = document.getElementById('customerFormError');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}


/*
* Скрываем сообщение обшибке
*/
function hideError() {
    const errorDiv = document.getElementById('customerFormError');
    errorDiv.style.display = 'none';
}

