class PromptModel:
    def think(self, mem): return "thought"
    def act(self, target): return "action"

class AgenticLoop:
    def __init__(self, model):
        self.model = model
        self.memory = []

    def step(self, observation):
        self.memory.append(observation)
        thought = self.model.think(self.memory)
        return self.model.act(thought)

if __name__ == "__main__":
    loop = AgenticLoop(PromptModel())
    print(loop.step("start node"))
