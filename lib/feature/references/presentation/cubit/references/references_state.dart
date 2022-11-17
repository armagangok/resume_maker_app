class ReferencesState {
	final bool isLoading;
	final String? error;
	  
	const ReferencesState({
		this.isLoading = false,
		this.error,
	});
	  
	ReferencesState copyWith({
		bool? isLoading,
		String? error,
	}) {
		return ReferencesState(
			isLoading: isLoading ?? this.isLoading,
			error: error ?? this.error,
		);
	}
}
