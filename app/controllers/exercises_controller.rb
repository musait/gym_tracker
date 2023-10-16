class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # Affiche tous les exercices
  def index
    @exercices = current_user.exercices
  end

  # Affiche un exercice spécifique
  def show
  end

  # Initialise un nouvel exercice pour le formulaire de création
  def new
    @exercise = Exercise.new
  end

  # Crée un nouvel exercice en fonction des paramètres soumis
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to @exercise, notice: 'L\'exercice a été créé avec succès.'
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pour un exercice spécifique
  def edit
  end

  # Met à jour un exercice spécifique en fonction des paramètres soumis
  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: 'L\'exercice a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime un exercice spécifique
  def destroy
    @exercise.destroy
    redirect_to exercises_url, notice: 'L\'exercice a été supprimé avec succès.'
  end

  private

  # Récupère l'exercice basé sur l'ID du paramètre
  def set_exercise
    @exercice = current_user.exercices.find(params[:id])
  end

  # Autorise seulement les paramètres sécurisés à être soumis
  def exercise_params
    params.require(:exercise).permit(:name, :description, :theme_id)
  end
end
