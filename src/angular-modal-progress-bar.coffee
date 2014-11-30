
angular.module('500tech-modal-progress-bar', [])
.service 'Loader', ($interval) ->
  states: {}
  loading: { progress: 0, phrase: '' }

  progressStart: (duration) ->
    @progressInterval = $interval =>
      @loading.progress += 1 unless @loading.progress >= 100
    , duration

  phraseProgressStart: (duration) ->
    phraseCount = 1
    @phraseInterval = $interval =>
      @loading.phrase = "#{@phrases[phraseCount]}..." unless phraseCount >= @phrases.length
      phraseCount += 1
    , duration

  start: (state) ->
    if state not in Object.keys(@states)
      console.log "State '#{state}' was not found in loader states"
      console.log "Declared loader states are: #{@states}"
      return
    @phrases = @states[state].phrases
    @loading.progress = 0
    @loading.phrase = @phrases[0]
    @progressStart(@states[state].duration * 10)
    @phraseProgressStart(@states[state].duration / (@phrases.length - 0.5) * 1000)

  end: ->
    @loading.progress = 0
    @loading.phrase = ''
    $interval.cancel(@progressInterval)
    $interval.cancel(@phraseInterval)

.directive 'progressModal', ->
  restrict: 'E'
  scope: {}
  controller: ($scope, Loader) ->
    $scope.loading = Loader.loading
  template: '''
              <div class="loader" ng-show="loading.progress">
                <div class="backdrop"></div>
                <div class="loader-box">
                  <div class="phrase">{{ loading.phrase }}</div>
                  <div class="progress-bar">
                    <div class="progress" style="width: {{ loading.progress }}%"></div>
                  </div>
                </div>
              </div>
            '''
