class WorkoutSessionsController < ApplicationController
  # Une session d'entraînement (WorkoutSession) peut représenter une séance d'entraînement spécifique qu'un utilisateur a réalisée à une date donnée.
  before_action :authenticate_user!
  before_action :set_workout_session, only: [:show, :edit, :update, :destroy]

  # Liste toutes les sessions d'entraînement
  def index
    @workout_sessions = current_user.workout_sessions
  end

  # Affiche une session d'entraînement spécifique
  def show
  end

  # Initialise une nouvelle session d'entraînement pour le formulaire de création
  def new
    @workout_session = WorkoutSession.new
  end

  # Crée une nouvelle session d'entraînement basée sur les paramètres soumis
  def create
    @workout_session = WorkoutSession.new(workout_session_params)
    if @workout_session.save
      redirect_to @workout_session, notice: 'La session d\'entraînement a été créée avec succès.'
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pour une session d'entraînement spécifique
  def edit
  end

  # Met à jour une session d'entraînement spécifique basée sur les paramètres soumis
  def update
    if @workout_session.update(workout_session_params)
      redirect_to @workout_session, notice: 'La session d\'entraînement a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime une session d'entraînement spécifique
  def destroy
    @workout_session.destroy
    redirect_to workout_sessions_url, notice: 'La session d\'entraînement a été supprimée avec succès.'
  end

  private

  # Récupère la session d'entraînement basée sur l'ID du paramètre
  def set_workout_session
    @workout_session = current_user.workout_sessions.find(params[:id])

  end

  # N'autorise que les paramètres sécurisés à être soumis
  def workout_session_params
    params.require(:workout_session).permit(:date, :user_id)
  end
end
