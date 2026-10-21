
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exprimer un besoin</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/tabler.min.css">
</head>

<body class="bg-light">
<div class="container py-5" style="max-width: 820px">

    <h1 class="mb-2">Exprimer un besoin</h1>
    <p class="text-secondary mb-4">
        Décrivez le besoin en personnel de votre département.
    </p>

    <c:if test="${not empty erreur}">
        <div class="alert alert-danger">
            <c:out value="${erreur}"/>
        </div>
    </c:if>
    <a href="${pageContext.request.contextPath}/besoin/liste"
           class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg"
                 width="18" height="18" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round"
                 style="margin-right: 6px; vertical-align: -4px;">
                <path d="M12 5v14"/>
                <path d="M5 12h14"/>
            </svg>
            Liste des demandes de besoin
    </a>

    <div class="card shadow-sm">
        <div class="card-body p-4">

            <form action="${pageContext.request.contextPath}/besoin/save"
                  method="post">

                <div class="mb-3">
                    <label for="posteId" class="form-label">
                        Poste concerné
                    </label>

                    <select name="posteId" id="posteId"
                            class="form-select" required>
                        <option value="">Choisir un poste</option>

                        <c:forEach items="${postes}" var="poste">
                            <option value="${poste.id}">
                                <c:out value="${poste.nom}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="motif" class="form-label">
                        Motif du besoin
                    </label>
                    <textarea name="motif" id="motif"
                              class="form-control"
                              maxlength="2000"
                              required></textarea>
                </div>

                <div class="mb-3">
                    <label for="budget" class="form-label">
                        Budget estimé
                    </label>
                    <input type="number" name="budget" id="budget"
                           class="form-control" min="0" required>
                </div>

                <div class="mb-3">
                    <label for="dateSouhaitee" class="form-label">
                        Date souhaitée
                    </label>
                    <input type="date" name="dateSouhaitee"
                           id="dateSouhaitee"
                           class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="demandeurId" class="form-label">
                        Demandeur
                    </label>

                    <select name="demandeurId" id="demandeurId"
                            class="form-select" required>
                        <option value="">Choisir un employé</option>

                        <c:forEach items="${employes}" var="employe">
                            <option value="${employe.id}">
                                Employé #${employe.id}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">
                    Soumettre la demande
                </button>
            </form>

        </div>
    </div>
</div>
</body>
</html>
