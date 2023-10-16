class WorkoutsController < ApplicationController
  # Un Workout représente un exercice spécifique réalisé lors d'une session d'entraînement (WorkoutSession).
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :set_workout_session, only: [:new, :create]

  def index
    @workouts = current_user.workouts
  end

  # Affiche un exercice spécifique
  def show
  end

  # Initialise un nouvel exercice pour le formulaire de création
  def new
    @workout = @workout_session.workouts.build
  end

  # Crée un nouvel exercice basé sur les paramètres soumis
  def create
    @workout = @workout_session.workouts.build(workout_params)
    if @workout.save
      redirect_to workout_session_path(@workout_session), notice: 'L\'exercice a été ajouté à la session.'
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pour un exercice spécifique
  def edit
  end

  # Met à jour un exercice spécifique basé sur les paramètres soumis
  def update
    if @workout.update(workout_params)
      redirect_to workout_session_path(@workout.workout_session), notice: 'L\'exercice a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime un exercice spécifique
  def destroy
    workout_session = @workout.workout_session
    @workout.destroy
    redirect_to workout_session_path(workout_session), notice: 'L\'exercice a été supprimé avec succès.'
  end

  private

  # Récupère l'exercice basé sur l'ID du paramètre
  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  # Récupère la session d'entraînement associée à l'exercice
  def set_workout_session
    @workout_session = WorkoutSession.find(params[:workout_session_id])
  end

  # N'autorise que les paramètres sécurisés à être soumis
  def workout_params
    params.require(:workout).permit(:exercise_id, :reps, :sets, :weight, :notes)
  end
end
