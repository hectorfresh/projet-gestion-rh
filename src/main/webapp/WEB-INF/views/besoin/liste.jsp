
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des besoins</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/tabler.min.css">

    <style>
        body {
            background: #f5f7fb;
            color: #182433;
        }

        .page-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            margin-bottom: 28px;
        }

        .page-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .page-subtitle {
            color: #667382;
            margin: 0;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(24, 36, 51, 0.05);
            overflow: hidden;
        }

        .card-header {
            background: #fff;
            padding: 20px 24px;
            border-bottom: 1px solid #e6eaf0;
        }

        .card-title {
            font-size: 1.05rem;
            font-weight: 600;
            margin: 0;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background: #f8fafc;
            color: #667382;
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            white-space: nowrap;
            padding: 16px;
        }

        .table tbody td {
            padding: 16px;
            vertical-align: middle;
        }

        .table tbody tr:hover {
            background: #f8fafc;
        }

        .budget {
            font-weight: 700;
            color: #206bc4;
            white-space: nowrap;
        }

        .date {
            white-space: nowrap;
            color: #667382;
        }

        .motif {
            min-width: 180px;
            max-width: 300px;
            white-space: normal;
        }

        .empty-state {
            text-align: center;
            padding: 48px 20px !important;
            color: #667382;
        }

        .empty-state p {
            margin: 8px 0 0;
        }

        @media (max-width: 576px) {
            .page-container {
                padding: 24px 12px;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .page-header .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>
<div class="page-container">

    <div class="page-header">
        <div>
            <h1 class="page-title">Gestion des besoins</h1>
            <p class="page-subtitle">
                Consultez les demandes de besoins et leurs informations.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/besoin/form"
           class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg"
                 width="18" height="18" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round"
                 style="margin-right: 6px; vertical-align: -4px;">
                <path d="M12 5v14"/>
                <path d="M5 12h14"/>
            </svg>
            Demander un besoin
        </a>
    </div>

    <c:if test="${not empty erreur}">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <c:out value="${erreur}"/>
        </div>oi
    </c:if>

    <div class="card">
        <div class="card-header">
            <h2 class="card-title">Liste des besoins</h2>
        </div>

        <div class="table-responsive">
            <table class="table table-vcenter table-hover">
                <thead>
                <tr>
                    <th>Date de création</th>
                    <th>Poste</th>
                    <th>Département</th>
                    <th>Budget</th>
                    <th>Date souhaitée</th>
                    <th>Motif</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="b" items="${besoins}">
                    <tr>
                        <td class="date">
                            <c:out value="${b.dateCreation}"/>
                        </td>

                        <td>
                            <span class="fw-bold">
                                <c:out value="${b.poste.nom}"/>
                            </span>
                        </td>

                        <td>
                            <c:out value="${b.poste.departement.nom}"/>
                        </td>

                        <td class="budget">
                            <c:out value="${b.budget}"/>
                        </td>

                        <td class="date">
                            <c:out value="${b.dateSouhaitee}"/>
                        </td>

                        <td class="motif">
                            <c:out value="${b.motif}"/>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty besoins}">
                    <tr>
                        <td colspan="6" class="empty-state">
                            <strong>Aucun besoin enregistré</strong>
                            <p>Commencez par créer votre première demande.</p>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
