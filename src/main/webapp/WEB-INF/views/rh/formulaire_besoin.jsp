<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exprimer un besoin</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tabler.min.css">

    <style>
        :root {
            --form-border: #e5eaf1;
            --form-muted: #667382;
            --form-background: #f5f7fb;
            --form-primary: #206bc4;
        }

        body {
            background: var(--form-background);
            color: #182433;
            -webkit-font-smoothing: antialiased;
        }

        .form-wrapper {
            max-width: 820px;
            margin: 0 auto;
            padding: 48px 20px;
        }

        .page-title {
            font-size: 1.8rem;
            font-weight: 700;
            letter-spacing: -0.04em;
        }

        .page-description {
            margin-top: 8px;
            color: var(--form-muted);
            font-size: .95rem;
            line-height: 1.6;
        }

        .form-card {
            overflow: hidden;
            border: 1px solid var(--form-border);
            border-radius: 14px;
            box-shadow: 0 4px 20px rgb(24 36 51 / 4%);
        }

        .form-section {
            padding: 30px;
        }

        .section-heading {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 28px;
        }

        .section-icon {
            display: flex;
            flex: 0 0 44px;
            align-items: center;
            justify-content: center;
            width: 44px;
            height: 44px;
            color: var(--form-primary);
            background: #eaf2fc;
            border-radius: 10px;
        }

        .section-title {
            margin: 0;
            font-size: 1.05rem;
            font-weight: 700;
        }

        .section-description {
            margin-top: 5px;
            color: var(--form-muted);
            font-size: .84rem;
            line-height: 1.5;
        }

        .form-label {
            margin-bottom: 9px;
            font-size: .88rem;
            font-weight: 600;
        }

        .required {
            color: #d63939;
        }

        .form-control,
        .form-select {
            min-height: 44px;
            border-color: #dce1e8;
            border-radius: 8px;
            box-shadow: none;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #90b8e8;
            box-shadow: 0 0 0 3px rgb(32 107 196 / 10%);
        }

        .form-hint {
            display: block;
            margin-top: 8px;
            color: var(--form-muted);
            font-size: .78rem;
            line-height: 1.5;
        }

        .form-footer {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 12px;
            padding: 22px 30px;
            background: #fff;
            border-top: 1px solid var(--form-border);
        }

        .btn {
            min-height: 42px;
            padding: 9px 18px;
            border-radius: 8px;
            font-weight: 600;
        }

        .status-info {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 12px;
            color: #946200;
            background: #fff5d9;
            border-radius: 8px;
            font-size: .82rem;
            font-weight: 600;
        }

        .status-dot {
            width: 7px;
            height: 7px;
            background: #e6a700;
            border-radius: 50%;
        }

        .alert-message {
            display: none;
            margin-bottom: 20px;
            border-radius: 9px;
        }

        @media (max-width: 575px) {
            .form-wrapper {
                padding: 26px 12px;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .form-section {
                padding: 22px 18px;
            }

            .form-footer {
                align-items: stretch;
                flex-direction: column;
                padding: 20px 18px;
            }

            .form-footer .btn {
                width: 100%;
            }
        }

        @media print {
            body {
                background: #fff;
            }

            .form-footer {
                display: none;
            }

            .form-card {
                box-shadow: none;
            }
        }
    </style>
</head>

<body>

<div class="form-wrapper">

    <!-- En-tête -->
    <header class="mb-4">
        <div class="text-secondary small fw-semibold
                    text-uppercase mb-2">
            Gestion des ressources humaines
        </div>

        <h1 class="page-title">Exprimer un besoin</h1>

        <p class="page-description">
            Sélectionnez le poste concerné, décrivez votre besoin
            et indiquez la date souhaitée.
        </p>
    </header>

    <!-- Message de retour -->
    <div id="message" class="alert alert-message" role="alert"></div>

    <!-- Formulaire -->
    <form id="besoinForm" onsubmit="insertBesoin(event)">

        <div class="card form-card">

            <section class="form-section">

                <div class="section-heading">
                    <div class="section-icon">
                        <svg xmlns="http://www.w3.org/2000/svg"
                             width="23" height="23"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke="currentColor"
                             stroke-width="1.8"
                             stroke-linecap="round"
                             stroke-linejoin="round"
                             aria-hidden="true">
                            <rect x="3" y="7" width="18" height="14"
                                  rx="2"></rect>
                            <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                        </svg>
                    </div>

                    <div>
                        <h2 class="section-title">
                            Informations du besoin
                        </h2>

                        <p class="section-description mb-0">
                            Les champs marqués d'un astérisque
                            sont obligatoires.
                        </p>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="poste" class="form-label">
                        Poste concerné
                        <span class="required">*</span>
                    </label>

                    <select class="form-select"
                            id="poste"
                            name="poste"
                            required>
                        <option value="" selected disabled>
                            Sélectionner un poste
                        </option>

                        <!-- Données statiques : remplacer par
                             les postes réels de la base -->
                        <option value="1">Développeur informatique</option>
                        <option value="2">Administrateur système</option>
                        <option value="3">Comptable</option>
                        <option value="4">Responsable des ressources humaines</option>
                        <option value="5">Assistant administratif</option>
                    </select>

                    <small class="form-hint">
                        Choisissez le poste pour lequel vous souhaitez
                        exprimer un besoin.
                    </small>
                </div>

                <div class="mb-4">
                    <label for="description" class="form-label">
                        Description du besoin
                        <span class="required">*</span>
                    </label>

                    <textarea class="form-control"
                              id="description"
                              name="description"
                              rows="5"
                              maxlength="2000"
                              placeholder="Décrivez votre besoin, les missions attendues, les compétences requises..."
                              required></textarea>

                    <small class="form-hint">
                        Précisez le contexte et les informations utiles
                        au traitement de votre demande.
                    </small>
                </div>

                <div class="mb-4">
                    <label for="dateSouhaitee" class="form-label">
                        Date souhaitée
                        <span class="required">*</span>
                    </label>

                    <input type="date"
                           class="form-control"
                           id="dateSouhaitee"
                           name="dateSouhaitee"
                           required>

                    <small class="form-hint">
                        Indiquez la date à laquelle le besoin
                        devrait être satisfait.
                    </small>
                </div>

                <!-- Statut initial -->
                <div>
                    <label class="form-label d-block">
                        Statut de la demande
                    </label>

                    <div class="status-info">
                        <span class="status-dot"></span>
                        En attente
                    </div>

                    <small class="form-hint">
                        Le statut sera automatiquement initialisé
                        à « en attente » lors de l'enregistrement.
                    </small>
                </div>

            </section>

            <!-- Actions -->
            <div class="form-footer">
                <button type="reset"
                        class="btn btn-outline-secondary">
                    Réinitialiser
                </button>

                <button type="submit"
                        class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         width="18" height="18"
                         viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2"
                         stroke-linecap="round"
                         stroke-linejoin="round"
                         style="vertical-align: -4px; margin-right: 5px;"
                         aria-hidden="true">
                        <path d="M5 12l4 4L19 6"></path>
                    </svg>
                    Valider le besoin
                </button>
            </div>

        </div>
    </form>

    <footer class="text-center text-secondary small mt-4">
        Gestion des besoins · Interface d'administration
    </footer>

</div>

<script>
    /**
     * Initialisation de la date minimale :
     * impossible de choisir une date passée.
     */
    const dateInput = document.getElementById("dateSouhaitee");

    const aujourdHui = new Date();
    const annee = aujourdHui.getFullYear();
    const mois = String(aujourdHui.getMonth() + 1).padStart(2, "0");
    const jour = String(aujourdHui.getDate()).padStart(2, "0");

    dateInput.min = `${annee}-${mois}-${jour}`;

    /**
     * Insertion d'un besoin.
     *
     * Le statut initial est "en attente".
     * Cette fonction prépare les données et affiche un message.
     * L'enregistrement réel nécessite un endpoint serveur.
     */
    function insertBesoin(event) {
        event.preventDefault();

        const formulaire = document.getElementById("besoinForm");
        const message = document.getElementById("message");

        if (!formulaire.checkValidity()) {
            formulaire.reportValidity();
            return;
        }

        const besoin = {
            posteId: document.getElementById("poste").value,
            description: document.getElementById("description").value.trim(),
            dateSouhaitee: document.getElementById("dateSouhaitee").value,
            statut: "en attente"
        };

        if (!besoin.description) {
            document.getElementById("description").focus();
            return;
        }

        /*
         * À connecter à votre backend :
         *
         * fetch("/api/besoins", {
         *     method: "POST",
         *     headers: {
         *         "Content-Type": "application/json"
         *     },
         *     body: JSON.stringify(besoin)
         * })
         * .then(response => {
         *     if (!response.ok) {
         *         throw new Error("Erreur lors de l'enregistrement");
         *     }
         *     return response.json();
         * })
         * .then(data => {
         *     afficherMessage("Besoin enregistré avec succès.", "success");
         *     formulaire.reset();
         * })
         * .catch(error => {
         *     afficherMessage(error.message, "danger");
         * });
         */

        console.log("Données du besoin à transmettre :", besoin);

        message.className = "alert alert-info alert-message";
        message.style.display = "block";
        message.textContent =
            "Formulaire valide. Connectez insertBesoin() à votre serveur pour enregistrer la demande.";

        message.scrollIntoView({
            behavior: "smooth",
            block: "center"
        });
    }
</script>

</body>
</html>
