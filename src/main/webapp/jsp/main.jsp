<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <%-- Hello, user --%>
    <div align="right">
        <c:choose>
            <c:when test="${not empty user}">
                <c:out value="Hello, ${user.firstName}"/>
                <div><a href="controller?command=logout">Logout</a></div>
            </c:when>
            <c:otherwise>
                <div>
                    <a href="controller?command=TO_LOGIN_PAGE">Login</a>
                    <a href="controller?command=TO_REGISTRATION_PAGE">Registration</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%--Button: add product--%>
    <form action="controller" method="post">
        <input type="hidden" name="command" value="to_add_product_page">
        <input type="submit" value="Добавить продукт">
    </form>

    <%-- Choose date for meals --%>
    <form name="calendarForm" method="post" action="controller">
        <input type="hidden" name="command" value="Select_date">
        <input type="date" name="chosenDate" value="${chosenDateSession}"/>

        <input type="submit" class="button" value="Select Date">
    </form>
    <br/>

    <%--Tabs: sport, water, stats--%>
    <ul class="nav nav-tabs nav-justified">
        <li class="active"><a data-toggle="tab" href="#food">Food</a></li>
        <li><a data-toggle="tab" href="#exercise">Exercise</a></li>
        <li><a data-toggle="tab" href="#water">Water</a></li>
        <li><a data-toggle="tab" href="#stats">Statistics</a></li>
    </ul>

    <div class="tab-content">
        <div id="food" class="tab-pane fade in active">
            <h3>Food</h3>
            <p>Some content</p>
        </div>
        <div id="exercise" class="tab-pane fade">
            <h3>Exercise</h3>
        </div>
        <div id="water" class="tab-pane fade">
            <h3>Water</h3>
        </div>
        <div id="stats" class="tab-pane fade">
            <h3>Statistics</h3>
        </div>
    </div>


    ${successAddProductMessage}
    ${errorAddProductMessage}


    <form method="post" action="controller">
        <input type="hidden" name="command" value="add_meal"/>
        <input type="hidden" name="user_id" value="${user.id}"/>
        <%--<input type="hidden" name="chosenDateHidden" value="${test2}"/>--%>


        <%--Search--%>
        <div class="row well">
            <label>Выбор продукта</label>
            <select name="product_id">
                <c:forEach var="product" items="${products}">
                    <option value="${product.id}">
                        <c:out value="${product.name}"/>
                    </option>
                </c:forEach>
            </select>
        </div>

        <%--enter amount--%>
        <div class="row well">
            <label>Количество</label>
            <input type="number" name="weight" step="1" min="1" value="100">
            <label> грамм</label>
        </div>

        <%--choose meal--%>
        <div class="row well">
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <div><label><input name="meal_number" value="1" type="radio" checked>Завтрак</label></div>
                <div><label><input name="meal_number" value="2" type="radio">Утренний перекус</label></div>
                <div><label><input name="meal_number" value="3" type="radio">Обед</label></div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <div><label><input name="meal_number" value="4" type="radio">Дневной перекус</label></div>
                <div><label><input name="meal_number" value="5" type="radio">Ужин</label></div>
                <div><label><input name="meal_number" value="6" type="radio">Вечерний перекус</label></div>
            </div>
        </div>

        <div>
            <input type="submit" value="Добавить в дневник питания">
        </div>

    </form>

    <%--menu--%>
    <c:if test="${not empty menu}">
        <div class="row well">

            <table class="table table-striped">
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th>Количество</th>
                    <th>Калории</th>
                    <th>Белки</th>
                    <th>Жиры</th>
                    <th>Углеводы</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="meal" items="${menu}">
                    <tr>
                        <td><c:out value="${meal.mealNumber}"></c:out></td>
                        <td><c:out value="${meal.product}"></c:out></td>
                        <td><c:out value="${meal.weight}"></c:out></td>
                        <td><c:out value="${meal.calories}"></c:out></td>
                        <td><c:out value="${meal.protein}"></c:out></td>
                        <td><c:out value="${meal.fat}"></c:out></td>
                        <td><c:out value="${meal.carbs}"></c:out></td>
                    </tr>
                </c:forEach>
                </tbody>

                <tbody>
                <tr>
                    <td></td>
                    <td>Итого за день:</td>
                    <td><c:out value="${userTotalWeight}"></c:out></td>
                    <td><c:out value="${userTotalCalories}"></c:out></td>
                    <td><c:out value="${userTotalProteins}"></c:out></td>
                    <td><c:out value="${userTotalFat}"></c:out></td>
                    <td><c:out value="${userTotalCarbs}"></c:out></td>
                </tr>
                <tr>
                    <td></td>
                    <td>Норма:</td>
                    <td></td>
                    <td><c:out value="${user.calorieNorm}"></c:out></td>
                </tr>
                </tbody>
            </table>
        </div>
    </c:if>

</div>

</div>

</body>
</html>
